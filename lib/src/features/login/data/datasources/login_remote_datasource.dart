import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship_ai_weather_app/src/core/di/dependency_injection.dart';
import 'package:internship_ai_weather_app/src/features/login/data/models/login_params.dart';

class LoginRemoteDatasource {
  const LoginRemoteDatasource();

  Future<UserCredential> login(LoginParams params) async {
    final credential =
        await getIt.get<FirebaseAuth>().signInWithEmailAndPassword(
              email: params.email,
              password: params.password,
            );

    return credential;
  }
}
