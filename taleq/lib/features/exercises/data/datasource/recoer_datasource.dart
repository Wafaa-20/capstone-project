// lib/data/datasources/record_datasource.dart

import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:dartz/dartz.dart';
import 'package:taleq/core/error/failures.dart';
import 'package:taleq/features/exercises/data/model/record_model.dart';

abstract class RecordDatasource {
  Future<Either<Failure, void>> startRecording();
  Future<Either<Failure, void>> stopRecording();
  Stream<Either<Failure, RecordModel>> getWaveformStream();
}

class RecordDatasourceImpl implements RecordDatasource {
  final RecorderController _controller = RecorderController();
  final StreamController<RecordModel> _waveController =
      StreamController<RecordModel>.broadcast();

  RecordDatasourceImpl() {
    // ضبط الإعدادات
    _controller
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;

    // استماع لتحديثات الموجة
    _controller.onProgress?.listen(
      (progress) {
        try {
          final amps = progress.decibels
                  ?.map((d) => d.toDouble())
                  .toList() ??
              <double>[];
          _waveController.add(RecordModel(amplitudes: amps));
        } catch (e) {
          // تمرير الخطأ في الستريم
          _waveController.addError(e);
        }
      },
      onError: (err) {
        _waveController.addError(err);
      },
    );
  }

  @override
  Future<Either<Failure, void>> startRecording() async {
    try {
      // اطلب إذن الميكروفون أولاً
      await _controller.checkPermission();
      await _controller.record();
      return const Right(null);
    } catch (e) {
      // في حالة أي خطأ
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> stopRecording() async {
    try {
      await _controller.stop();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, RecordModel>> getWaveformStream() {
    // نحول كل RecordModel إلى Right(model)
    // وأي خطأ في الستريم نلتقطه ونرسله كـ Left(ServerFailure)
    return _waveController.stream
        .map<Either<Failure, RecordModel>>(
          (model) => Right(model),
        )
        .handleError(
          (e) => Left(ServerFailure(message: e.toString())),
        );
  }

  /// نظف الموارد عند الانتهاء
  void dispose() {
    _waveController.close();
    _controller.dispose();
  }
}
