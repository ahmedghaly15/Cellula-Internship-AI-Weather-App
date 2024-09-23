import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/di/dependency_injection.dart';
import 'package:internship_ai_weather_app/src/core/router/routes.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/views/home_view.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/blocs/login_bloc.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/views/login_view.dart';
import 'package:internship_ai_weather_app/src/features/register/presentation/bloc/register_bloc.dart';
import 'package:internship_ai_weather_app/src/features/register/presentation/views/register_view.dart';
import 'package:internship_ai_weather_app/src/features/start/presentation/views/start_view.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.startRoute:
        return MaterialPageRoute(
          builder: (_) => const StartView(),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginBloc>(
            create: (_) => getIt.get<LoginBloc>(),
            child: const LoginView(),
          ),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt.get<RegisterBloc>(),
            child: const RegisterView(),
          ),
        );

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            "Un Found Route",
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
