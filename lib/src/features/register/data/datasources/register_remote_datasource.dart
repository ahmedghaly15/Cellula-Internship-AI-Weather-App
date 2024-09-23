import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship_ai_weather_app/src/core/di/dependency_injection.dart';
import 'package:internship_ai_weather_app/src/core/firebase/firebase_collections.dart';
import 'package:internship_ai_weather_app/src/core/models/app_user.dart';
import 'package:internship_ai_weather_app/src/core/models/auth_action_params.dart';

class RegisterRemoteDataSource {
  const RegisterRemoteDataSource();

  Future<UserCredential> register(AuthActionParams params) async {
    final credential =
        await getIt.get<FirebaseAuth>().createUserWithEmailAndPassword(
              email: params.email,
              password: params.password,
            );
    return credential;
  }

  Future<void> saveUserInFirebaseDatabase(AppUser appUser) async {
    await getIt
        .get<FirebaseFirestore>()
        .collection(FirebaseCollections.usersCollection)
        .doc(appUser.userId)
        .set(appUser.toJson());
  }
}
