import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/ai_weather_app.dart';
import 'package:internship_ai_weather_app/src/core/di/dependency_injection.dart';
import 'package:internship_ai_weather_app/src/core/firebase/firebase_options.dart';
import 'package:internship_ai_weather_app/src/core/utils/bloc_observer.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/check_if_user_is_logged_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();
  Bloc.observer = MyBlocObserver();
  // To fix texts being hidden bug in release mode
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await checkIfUserIsLoggedIn();
  runApp(const AIWeatherApp());
}
