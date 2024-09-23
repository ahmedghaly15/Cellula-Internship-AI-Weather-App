import 'dart:convert';

import 'package:internship_ai_weather_app/src/core/helpers/cache_keys.dart';
import 'package:internship_ai_weather_app/src/core/helpers/secure_storage_helper.dart';
import 'package:internship_ai_weather_app/src/core/models/app_user.dart';

Future<void> cacheUserId(String userId) async {
  await SecureStorageHelper.setSecuredString(CacheKeys.userId, userId);
}

Future<void> cacheAppUser(AppUser appUser) async {
  await SecureStorageHelper.setSecuredString(
    CacheKeys.appUser,
    json.encode(appUser.toJson()),
  );
}
