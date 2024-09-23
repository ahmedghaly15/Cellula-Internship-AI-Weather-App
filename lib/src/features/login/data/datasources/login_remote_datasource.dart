import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship_ai_weather_app/src/core/di/dependency_injection.dart';
import 'package:internship_ai_weather_app/src/core/models/app_user.dart';
import 'package:internship_ai_weather_app/src/core/models/auth_action_params.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/get_firebase_user_data.dart';

class LoginRemoteDatasource {
  const LoginRemoteDatasource();

  Future<AppUser> login(AuthActionParams params) async {
    final credential =
        await getIt.get<FirebaseAuth>().signInWithEmailAndPassword(
              email: params.email,
              password: params.password,
            );

    final firebaseUser = await getFirebaseUserData(credential.user!.uid);
    return AppUser.fromJson(firebaseUser.data()!);
  }
}
