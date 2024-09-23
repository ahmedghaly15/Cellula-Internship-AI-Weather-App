import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship_ai_weather_app/src/core/di/dependency_injection.dart';
import 'package:internship_ai_weather_app/src/core/models/app_user.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/get_firebase_user_data.dart';
import 'package:internship_ai_weather_app/src/features/login/data/models/login_params.dart';

class LoginRemoteDatasource {
  const LoginRemoteDatasource();

  Future<AppUser> login(LoginParams params) async {
    final credential =
        await getIt.get<FirebaseAuth>().signInWithEmailAndPassword(
              email: params.email,
              password: params.password,
            );

    final firebaseUser = await getFirebaseUserData(credential.user!.uid);
    return AppUser.fromJson(firebaseUser.data()!);
  }
}
