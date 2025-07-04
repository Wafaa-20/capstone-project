import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart'
    show Supabase, SupabaseClient;
import 'package:taleq/core/service/local_storage.dart';
import 'package:taleq/features/auth/data/datasources/supabase_datasource.dart';
import 'package:taleq/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:taleq/features/auth/domain/repositories/auth_repository.dart';
import 'package:taleq/features/auth/domain/usecases/change_password_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/login_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/otp_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/resend_otp_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/signup_use_case.dart';
import 'package:taleq/features/auth/domain/usecases/signup_with_apple_usecase.dart';
import 'package:taleq/features/auth/domain/usecases/signup_with_google_usecase.dart';
import 'package:taleq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:taleq/features/groups/data/datasources/supabase_datasource.dart';
import 'package:taleq/features/groups/data/repositories/groups_repository_impl.dart';
import 'package:taleq/features/groups/domain/repositories/groups_repository.dart';
import 'package:taleq/features/groups/domain/usecases/get_space_details_use_case.dart';
import 'package:taleq/features/groups/domain/usecases/get_spaces_use_case.dart';
import 'package:taleq/features/groups/presentation/bloc/groups_bloc.dart';
import 'package:taleq/features/specialists/data/datasources/specialists_datasource.dart';
import 'package:taleq/features/specialists/data/repositories/specialists_repository_impl.dart';
import 'package:taleq/features/specialists/domain/repositories/specialists_repository.dart';
import 'package:taleq/features/specialists/domain/usecases/get_specialists.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_bloc.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/data/datasources/camera_analysis_datasource.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/data/repositories/camera_analysis_repository_impl.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/domain/repositories/camera_analysis_repository.dart';
import 'package:taleq/features/stuttering_assessment/camera_analysis/domain/usecases/get_camera_analysis.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/data/datasources/questionnaire_datasource.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/data/repositories/questionnaire_repository_impl.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/domain/repositories/questionnaire_repository.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/domain/usecases/save_answers_use_case.dart';
import 'package:taleq/features/stuttering_assessment/questionnaire/presentation/bloc/questionnaire_bloc.dart';

Future<void> setup() async {
  // Core Services
  GetIt.I.registerSingletonAsync<LocalStorage>(() async {
    final localStorage = LocalStorage();
    await localStorage.init();
    return localStorage;
  });
  GetIt.I.registerSingleton<SupabaseClient>(Supabase.instance.client);

  // Data Sources
  GetIt.I.registerLazySingleton<AuthRemoteDatasource>(
    () => SupabaseDatasource(supabase: GetIt.I()),
  );
  GetIt.I.registerLazySingleton<QuestionnaireDatasource>(
    () => QuestionnaireDatasourceImpl(supabase: GetIt.I()),
  );
  GetIt.I.registerLazySingleton<CameraAnalysisDatasource>(
    () => CameraAnalysisDatasourceImpl(),
  );
  GetIt.I.registerLazySingleton<SpecialistsDatasource>(
    () => SpecialistsDatasourceImpl(supabase: GetIt.I()),
  );

  // Repositories
  GetIt.I.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(datasource: GetIt.I()),
  );
  GetIt.I.registerLazySingleton<GroupsRemoteDatasource>(
    () => GroupsSupabaseDatasource(supabase: GetIt.I()),
  );

  GetIt.I.registerLazySingleton<GroupsRepository>(
    () => GroupsRepositoryImpl(GetIt.I()),
  );
  GetIt.I.registerLazySingleton<QuestionnaireRepository>(
    () => QuestionnaireRepositoryImpl(datasource: GetIt.I()),
  );
  GetIt.I.registerLazySingleton<CameraAnalysisRepository>(
    () => CameraAnalysisRepositoryImpl(datasource: GetIt.I()),
  );
  GetIt.I.registerLazySingleton<SpecialistsRepository>(
    () => SpecialistsRepositoryImpl(datasource: GetIt.I()),
  );

  // UseCases
  GetIt.I.registerLazySingleton(() => SignupUseCase(repository: GetIt.I()));
  GetIt.I.registerLazySingleton(() => LoginUseCase(repository: GetIt.I()));
  GetIt.I.registerLazySingleton(
    () => ChangePasswordUseCase(repository: GetIt.I()),
  );
  GetIt.I.registerLazySingleton(
    () => ForgetPasswordUseCase(repository: GetIt.I()),
  );
  GetIt.I.registerLazySingleton(() => OTPUseCase(repository: GetIt.I()));
  GetIt.I.registerLazySingleton(() => ResendOTPUseCase(repository: GetIt.I()));
  GetIt.I.registerLazySingleton(
    () => SignupWithGoogleUseCase(repository: GetIt.I()),
  );
  GetIt.I.registerLazySingleton(
    () => SignupWithAppleUseCase(repository: GetIt.I()),
  );
  GetIt.I.registerLazySingleton(
    () => SaveAnswersUseCase(repository: GetIt.I()),
  );
  GetIt.I.registerLazySingleton(
    () => CameraAnalysisUseCase(repository: GetIt.I()),
  );
  GetIt.I.registerLazySingleton(
    () => GetSpecialistsUseCase(repository: GetIt.I()),
  );

  GetIt.I.registerLazySingleton(() => GetSpacesUseCase(repository: GetIt.I()));
  GetIt.I.registerLazySingleton(
    () => GetSpaceDetailsUseCase(repository: GetIt.I()),
  );
  // Blocs
  GetIt.I.registerFactory(
    () => AuthBloc(
      GetIt.I(),
      GetIt.I(),
      GetIt.I(),
      GetIt.I(),
      GetIt.I(),
      GetIt.I(),
      GetIt.I(),
      GetIt.I(),
    ),
  );
  GetIt.I.registerFactory(() => QuestionnaireBloc(GetIt.I()));
  GetIt.I.registerFactory(() => GroupsBloc(GetIt.I(), GetIt.I()));
  GetIt.I.registerFactory(() => SpecialistsBloc(GetIt.I()));
}
