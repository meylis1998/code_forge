import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/get_current_user_usecase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/problems/data/datasources/problem_local_data_source.dart';
import '../../features/problems/data/datasources/problem_remote_data_source.dart';
import '../../features/problems/data/repositories/problem_repository_impl.dart';
import '../../features/problems/domain/repositories/problem_repository.dart';
import '../../features/problems/domain/usecases/get_problem_detail_usecase.dart';
import '../../features/problems/domain/usecases/get_problems_usecase.dart';
import '../../features/problems/domain/usecases/get_tags_usecase.dart';
import '../../features/problems/presentation/bloc/problem_list_bloc.dart';
import '../../features/contests/data/datasources/contest_remote_data_source.dart';
import '../../features/contests/presentation/bloc/contest_bloc.dart';
import '../../features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../features/editor/data/repositories/code_execution_repository_impl.dart';
import '../../features/editor/data/repositories/note_repository_impl.dart';
import '../../features/editor/domain/repositories/code_execution_repository.dart';
import '../../features/editor/domain/repositories/note_repository.dart';
import '../../features/editor/presentation/bloc/code_editor_bloc.dart';
import '../../features/editor/presentation/bloc/code_execution_bloc.dart';
import '../../features/editor/presentation/bloc/note_cubit.dart';
import '../../features/editor/presentation/bloc/solution_cubit.dart';
import '../../features/settings/presentation/bloc/code_template_cubit.dart';
import '../../features/submissions/presentation/bloc/submissions_bloc.dart';
import '../constants/api_constants.dart';
import '../database/app_database.dart';
import '../database/daos/code_template_dao.dart';
import '../database/daos/note_dao.dart';
import '../database/daos/problem_dao.dart';
import '../database/daos/submission_dao.dart';
import '../database/daos/topic_tag_dao.dart';
import '../database/daos/user_progress_dao.dart';
import '../network/interceptors/cookie_interceptor.dart';
import '../network/interceptors/retry_interceptor.dart';
import '../network/leetcode_api_client.dart';
import '../network/network_info.dart';
import '../storage/secure_storage_helper.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // ──── External ────
  sl
    ..registerLazySingleton<Connectivity>(Connectivity.new)
    ..registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    );

  // ──── Core ────
  sl
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl<Connectivity>()),
    )
    ..registerLazySingleton<SecureStorageHelper>(
      () => SecureStorageHelper(sl<FlutterSecureStorage>()),
    );

  // ──── Dio ────
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: {
        'Content-Type': ApiConstants.contentType,
        'Origin': ApiConstants.origin,
      },
    ),
  );

  dio.interceptors.addAll([
    CookieInterceptor(sl<SecureStorageHelper>()),
    RetryInterceptor(dio: dio),
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ),
  ]);

  sl.registerLazySingleton<Dio>(() => dio);

  // ──── API Client ────
  sl.registerLazySingleton<LeetCodeApiClient>(
    () => LeetCodeApiClient(
      dio: sl<Dio>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // ──── Database ────
  sl.registerLazySingleton<AppDatabase>(AppDatabase.new);

  // ──── DAOs ────
  sl
    ..registerLazySingleton<ProblemDao>(
      () => ProblemDao(sl<AppDatabase>()),
    )
    ..registerLazySingleton<TopicTagDao>(
      () => TopicTagDao(sl<AppDatabase>()),
    )
    ..registerLazySingleton<SubmissionDao>(
      () => SubmissionDao(sl<AppDatabase>()),
    )
    ..registerLazySingleton<UserProgressDao>(
      () => UserProgressDao(sl<AppDatabase>()),
    )
    ..registerLazySingleton<NoteDao>(
      () => NoteDao(sl<AppDatabase>()),
    )
    ..registerLazySingleton<CodeTemplateDao>(
      () => CodeTemplateDao(sl<AppDatabase>()),
    );

  // ──── Feature: Auth ────
  sl
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl<LeetCodeApiClient>()),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: sl<AuthRemoteDataSource>(),
        secureStorage: sl<SecureStorageHelper>(),
      ),
    )
    ..registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()))
    ..registerLazySingleton(
      () => GetCurrentUserUseCase(sl<AuthRepository>()),
    )
    ..registerLazySingleton(() => LogoutUseCase(sl<AuthRepository>()))
    ..registerFactory(
      () => AuthBloc(
        loginUseCase: sl<LoginUseCase>(),
        getCurrentUserUseCase: sl<GetCurrentUserUseCase>(),
        logoutUseCase: sl<LogoutUseCase>(),
      ),
    );

  // ──── Feature: Problems ────
  sl
    ..registerLazySingleton(
      () => ProblemLocalDataSource(
        problemDao: sl<ProblemDao>(),
        topicTagDao: sl<TopicTagDao>(),
      ),
    )
    ..registerLazySingleton(
      () => ProblemRemoteDataSource(sl<LeetCodeApiClient>()),
    )
    ..registerLazySingleton<ProblemRepository>(
      () => ProblemRepositoryImpl(
        localDataSource: sl<ProblemLocalDataSource>(),
        remoteDataSource: sl<ProblemRemoteDataSource>(),
        networkInfo: sl<NetworkInfo>(),
      ),
    )
    ..registerLazySingleton(
      () => GetProblemsUseCase(sl<ProblemRepository>()),
    )
    ..registerLazySingleton(
      () => GetProblemDetailUseCase(sl<ProblemRepository>()),
    )
    ..registerLazySingleton(
      () => GetTagsUseCase(sl<ProblemRepository>()),
    )
    ..registerFactory(
      () => ProblemListBloc(
        getProblems: sl<GetProblemsUseCase>(),
        problemRepository: sl<ProblemRepository>(),
      ),
    );

  // ──── Feature: Editor ────
  sl
    ..registerLazySingleton<CodeExecutionRepository>(
      () => CodeExecutionRepositoryImpl(
        apiClient: sl<LeetCodeApiClient>(),
        submissionDao: sl<SubmissionDao>(),
      ),
    )
    ..registerLazySingleton<NoteRepository>(
      () => NoteRepositoryImpl(noteDao: sl<NoteDao>()),
    )
    ..registerFactory(
      () => CodeEditorBloc(
        getProblemDetail: sl<GetProblemDetailUseCase>(),
        codeTemplateDao: sl<CodeTemplateDao>(),
      ),
    )
    ..registerFactory(
      () => CodeExecutionBloc(
        repository: sl<CodeExecutionRepository>(),
      ),
    )
    ..registerFactory(
      () => NoteCubit(noteRepository: sl<NoteRepository>()),
    )
    ..registerFactory(
      () => SolutionCubit(problemRepository: sl<ProblemRepository>()),
    );

  // ──── Feature: Dashboard ────
  sl
    ..registerLazySingleton(
      () => DashboardRemoteDataSource(sl<LeetCodeApiClient>()),
    )
    ..registerFactory(
      () => DashboardBloc(
        remoteDataSource: sl<DashboardRemoteDataSource>(),
      ),
    );

  // ──── Feature: Contests ────
  sl
    ..registerLazySingleton(
      () => ContestRemoteDataSource(sl<LeetCodeApiClient>()),
    )
    ..registerFactory(
      () => ContestBloc(remoteDataSource: sl<ContestRemoteDataSource>()),
    );

  // ──── Feature: Submissions ────
  sl.registerFactory(
    () => SubmissionsBloc(submissionDao: sl<SubmissionDao>()),
  );

  // ──── Feature: Settings ────
  sl.registerFactory(
    () => CodeTemplateCubit(codeTemplateDao: sl<CodeTemplateDao>()),
  );
}

Future<void> disposeDependencies() async {
  await sl<AppDatabase>().close();
  sl<Dio>().close();
  await sl.reset();
}
