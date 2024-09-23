import 'dart:convert';

import 'package:internship_ai_weather_app/src/core/helpers/cache_keys.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/helpers/secure_storage_helper.dart';
import 'package:internship_ai_weather_app/src/core/models/app_user.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/cache_user.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/get_firebase_user_data.dart';

bool isUserLoggedIn = false;
AppUser? currentUser;

Future<void> checkIfUserIsLoggedIn() async {
  final cachedUserId =
      await SecureStorageHelper.getSecuredString(CacheKeys.userId);
  if (cachedUserId.isNullOrEmpty) {
    isUserLoggedIn = false;
  } else {
    currentUser = await _getCachedOrRemoteUser(cachedUserId);
    isUserLoggedIn = true;
  }
}

Future<AppUser> _getCachedOrRemoteUser(String userId) async {
  final cachedUser =
      await SecureStorageHelper.getSecuredString(CacheKeys.appUser);

  if (cachedUser.isNullOrEmpty) {
    final user = await getFirebaseUserData(userId);
    final AppUser appUser = AppUser.fromJson(user.data()!);
    await cacheAppUser(appUser);
    return appUser;
  } else {
    return AppUser.fromJson(json.decode(cachedUser));
  }
}
