import 'package:internship_ai_weather_app/src/core/firebase/firebase_request_result.dart';
import 'package:internship_ai_weather_app/src/core/models/app_user.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/execute_and_handle_firebase_errors.dart';
import 'package:internship_ai_weather_app/src/features/login/data/datasources/login_remote_datasource.dart';
import 'package:internship_ai_weather_app/src/features/login/data/models/login_params.dart';

class LoginRepo {
  final LoginRemoteDatasource _remoteDatasource;

  LoginRepo(this._remoteDatasource);

  Future<FirebaseRequestResult<AppUser>> login(
    LoginParams params,
  ) {
    return executeAndHandleFirebaseErrors<AppUser>(
      () async => await _remoteDatasource.login(params),
    );
  }
}
