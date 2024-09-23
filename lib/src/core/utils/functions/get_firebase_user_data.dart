import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internship_ai_weather_app/src/core/di/dependency_injection.dart';
import 'package:internship_ai_weather_app/src/core/firebase/firebase_collections.dart';

Future<DocumentSnapshot<Map<String, dynamic>>> getFirebaseUserData(
  String userId,
) async {
  return await getIt
      .get<FirebaseFirestore>()
      .collection(FirebaseCollections.usersCollection)
      .doc(userId)
      .get();
}
