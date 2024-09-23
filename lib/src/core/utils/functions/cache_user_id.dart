import 'package:internship_ai_weather_app/src/core/helpers/cache_keys.dart';
import 'package:internship_ai_weather_app/src/core/helpers/secure_storage_helper.dart';

Future<void> cacheUserId(String userId) async {
  await SecureStorageHelper.setSecuredString(CacheKeys.userId, userId);
}
