import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship_ai_weather_app/src/core/firebase/firebase_request_result.dart';
import 'package:internship_ai_weather_app/src/core/models/app_user.dart';
import 'package:internship_ai_weather_app/src/core/models/auth_action_params.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/execute_and_handle_firebase_errors.dart';
import 'package:internship_ai_weather_app/src/features/register/data/datasources/register_remote_datasource.dart';

class RegisterRepo {
  final RegisterRemoteDataSource _remoteDataSource;

  RegisterRepo(this._remoteDataSource);

  Future<FirebaseRequestResult<UserCredential>> register(
    AuthActionParams params,
  ) async {
    return executeAndHandleFirebaseErrors(
      () async => await _remoteDataSource.register(params),
    );
  }

  Future<void> saveUserInFirebaseDatabase(AppUser appUser) async {
    await _remoteDataSource.saveUserInFirebaseDatabase(appUser);
  }
}
