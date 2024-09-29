import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/di/dependency_injection.dart';
import 'package:internship_ai_weather_app/src/core/router/routes.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/check_if_user_is_logged_in.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_event.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/views/current_city_weather_view.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/views/forecast_view.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_bloc.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_event.dart';
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
      case '/':
        return isUserLoggedIn
            ? _homeRoute()
            : MaterialPageRoute(
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
        return _homeRoute();

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt.get<RegisterBloc>(),
            child: const RegisterView(),
          ),
        );

      case Routes.forecastRoute:
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ForecastBloc>(
            create: (_) =>
                getIt.get<ForecastBloc>()..add(FetchForecastEvent(args)),
            child: ForecastView(city: args),
          ),
        );

      case Routes.currentCityWeather:
        final args = routeSettings.arguments as Current;
        return MaterialPageRoute(
          builder: (_) => CurrentCityWeatherView(currentCityWeather: args),
        );

      default:
        return _unFoundRoute();
    }
  }

  static MaterialPageRoute<dynamic> _homeRoute() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider<HomeBloc>(
        create: (_) =>
            getIt.get<HomeBloc>()..add(EnableLocationPermissionEvent()),
        child: const HomeView(),
      ),
    );
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
