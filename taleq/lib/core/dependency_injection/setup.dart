import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart'
    show Supabase, SupabaseClient;
import 'package:taleq/core/service/local_storage.dart';
import 'package:taleq/features/auth/data/datasources/supabase_datasource.dart';
import 'package:taleq/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:taleq/features/auth/domain/repositories/auth_repository.dart';
import 'package:taleq/features/auth/domain/usecases/login_use_case%20.dart';
import 'package:taleq/features/auth/domain/usecases/otp_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/signup_use_case%20.dart';
import 'package:taleq/features/auth/domain/usecases/signup_with_apple_usecase.dart';
import 'package:taleq/features/auth/domain/usecases/signup_with_google_usecase.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/data/datasources/questionnaire_datasource.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/data/repositories/questionnaire_repository_impl.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/domain/repositories/questionnaire_repository.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/domain/usecases/save_answers_use_case.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/presentation/bloc/questionnaire_bloc.dart';

Future<void> setup() async {
  //Shared Preferences
  GetIt.I.registerSingletonAsync<LocalStorage>(() async {
    final localStorage = LocalStorage();
    await localStorage.init();
    return localStorage;
  });
  //Supabase
  GetIt.I.registerSingleton<SupabaseClient>(Supabase.instance.client);

  // Bloc
  GetIt.I.registerFactory(
    () => AuthBloc(GetIt.I(), GetIt.I(), GetIt.I(), GetIt.I(), GetIt.I()),
  );
  GetIt.I.registerFactory(() => QuestionnaireBloc(GetIt.I()));

  // Use cases
  GetIt.I.registerLazySingleton(() => SignupUseCase(repository: GetIt.I()));
  GetIt.I.registerLazySingleton(() => LoginUseCase(repository: GetIt.I()));
  GetIt.I.registerLazySingleton(
    () => SaveAnswersUseCase(repository: GetIt.I()),
  );
  //===================================================
  GetIt.I.registerLazySingleton(
    () => SignupWithGoogleUseCase(repository: GetIt.I()),
  );

  //==========================
  GetIt.I.registerLazySingleton(
    () => SignupWithAppleUseCase(repository: GetIt.I()),
  );
  GetIt.I.registerLazySingleton(() => OTPUseCase(repository: GetIt.I()));
  // Repository
  GetIt.I.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(datasource: GetIt.I()),
  );
  GetIt.I.registerLazySingleton<QuestionnaireRepository>(
    () => QuestionnaireRepositoryImpl(datasource: GetIt.I()),
  );
  // Data sources
  GetIt.I.registerLazySingleton<AuthRemoteDatasource>(
    () => SupabaseDatasource(supabase: GetIt.I()),
  );
  GetIt.I.registerLazySingleton<QuestionnaireDatasource>(
    () => QuestionnaireDatasourceImpl(supabase: GetIt.I()),
  );
}
