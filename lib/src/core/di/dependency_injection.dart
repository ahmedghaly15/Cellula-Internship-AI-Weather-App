import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:internship_ai_weather_app/src/core/network/internet_checker.dart';
import 'package:internship_ai_weather_app/src/features/login/data/datasources/login_remote_datasource.dart';
import 'package:internship_ai_weather_app/src/features/login/data/repositories/login_repo.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/blocs/login_bloc.dart';

final GetIt getIt = GetIt.instance;

void setupDI() {
  _setupDIForExternal();
  _setupForCore();
  _setupForDatasources();
  _setupForRepos();
  _setupForBlocs();
}

void _setupDIForExternal() {
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
}

void _setupForRepos() {
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt.get<LoginRemoteDatasource>()),
  );
}

void _setupForBlocs() {
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(getIt.get<LoginRepo>()),
  );
}
