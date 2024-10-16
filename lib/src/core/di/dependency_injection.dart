import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:internship_ai_weather_app/src/core/api/dio_factory.dart';
import 'package:internship_ai_weather_app/src/core/network/internet_checker.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/api/forecast_api_service.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/repositories/forecast_repo_impl.dart';
import 'package:internship_ai_weather_app/src/features/forecast/domain/repositories/forecast_repo.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:internship_ai_weather_app/src/features/home/data/api/home_api_service.dart';
import 'package:internship_ai_weather_app/src/features/home/data/repositories/home_repo_impl.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/repositories/home_repo.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_bloc.dart';
import 'package:internship_ai_weather_app/src/features/login/data/datasources/login_remote_datasource.dart';
import 'package:internship_ai_weather_app/src/features/login/data/repositories/login_repo.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/blocs/login_bloc.dart';
import 'package:internship_ai_weather_app/src/features/register/data/datasources/register_remote_datasource.dart';
import 'package:internship_ai_weather_app/src/features/register/data/repositories/register_repo.dart';
import 'package:internship_ai_weather_app/src/features/register/presentation/bloc/register_bloc.dart';

final GetIt getIt = GetIt.instance;

void setupDI() {
  _setupDIForExternal();
  _setupForCore();
  _setupForDatasources();
  _setupForRepos();
  _setupForBlocs();
}

Future<void> _setupDIForExternal() async {
  const flutterSecureStorage = FlutterSecureStorage();
  getIt.registerLazySingleton<FlutterSecureStorage>(() => flutterSecureStorage);
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
}

void _setupForCore() {
  getIt.registerLazySingleton<InternetChecker>(
    () => InternetChecker(getIt<InternetConnectionChecker>()),
  );
}

void _setupForDatasources() {
  getIt.registerLazySingleton<LoginRemoteDatasource>(
    () => const LoginRemoteDatasource(),
  );
  getIt.registerLazySingleton<RegisterRemoteDataSource>(
    () => const RegisterRemoteDataSource(),
  );
  final Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<HomeApiService>(
    () => HomeApiService(dio),
  );

  getIt.registerLazySingleton<ForecastApiService>(
    () => ForecastApiService(dio),
  );
}

void _setupForRepos() {
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt.get<LoginRemoteDatasource>()),
  );
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(getIt.get<RegisterRemoteDataSource>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(getIt.get<HomeApiService>()),
  );
  getIt.registerLazySingleton<ForecastRepo>(
    () => ForecastRepoImpl(getIt.get<ForecastApiService>()),
  );
}

void _setupForBlocs() {
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(getIt.get<LoginRepo>()),
  );
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(getIt.get<RegisterRepo>()),
  );
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(getIt.get<HomeRepo>()),
  );
  getIt.registerFactory<ForecastBloc>(
    () => ForecastBloc(getIt.get<ForecastRepo>()),
  );
}




// a Unit type to be used as a placeholder
// abstract class Unit extends Object with BaseApiService {}

// void _registerModule<
//     ApiService extends BaseApiService,
//     Datasource extends Object,
//     Repo extends Object,
//     UseCase extends Object,
//     Bloc extends Object>({
//   ApiService Function()? apiServiceFactoryFunc,
//   Datasource Function()? datasourceFactoryFunc,
//   required Repo Function(dynamic apiServiceOrDatasource) repoConstructor,
//   UseCase Function(Repo repo)? useCaseConstructor,
//   required Bloc Function(List<dynamic> dependencies) blocConstructor,
//   List<Type> Function()? blocDependencies,
// }) {
//   // Register ApiService if provided
//   if (apiServiceFactoryFunc != null && ApiService != Unit) {
//     getIt.registerLazySingleton<ApiService>(
//       apiServiceFactoryFunc,
//     );
//   }

//   // Register Datasource if provided
//   if (datasourceFactoryFunc != null && Datasource != Unit) {
//     getIt.registerLazySingleton<Datasource>(
//       datasourceFactoryFunc,
//     );
//   }

//   // Register Repository
//   getIt.registerLazySingleton<Repo>(() {
//     if (datasourceFactoryFunc != null && Datasource != Unit) {
//       return repoConstructor(getIt.get<Datasource>());
//     } else if (apiServiceFactoryFunc != null && ApiService != Unit) {
//       return repoConstructor(getIt.get<ApiService>());
//     } else {
//       throw StateError('Neither ApiService nor Datasource is available');
//     }
//   });

//   // Register UseCase if provided
//   if (useCaseConstructor != null && UseCase != Unit) {
//     getIt.registerLazySingleton<UseCase>(
//       () => useCaseConstructor(getIt.get<Repo>()),
//     );
//   }

//   // Register Bloc/Cubit (always required)
//    getIt.registerFactory<Bloc>(() {
//     final dependencies = blocDependencies?.call() ?? [
//       if (UseCase != Unit) UseCase else Repo
//     ];
    
//     return blocConstructor(
//       dependencies.map((type) => getIt.get()).toList(),
//     );
//   });
// }