import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';

@immutable
sealed class ForecastEvent {}

final class FetchForecastEvent extends ForecastEvent {
  final String city;

  FetchForecastEvent(this.city);
}

final class UpdateSelectedDayEvent extends ForecastEvent {
  final int selectedDay;

  UpdateSelectedDayEvent(this.selectedDay);
}

final class TennisPlayPrediction extends ForecastEvent {
  final Current current;

  TennisPlayPrediction(this.current);
}
