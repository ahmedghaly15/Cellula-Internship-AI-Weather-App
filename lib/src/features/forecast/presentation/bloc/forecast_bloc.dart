import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_ai_weather_app/src/features/forecast/domain/repositories/forecast_repo.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_event.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final ForecastRepo _forecastRepo;

  ForecastBloc(this._forecastRepo) : super(const ForecastState.initial()) {
    on<FetchForecastEvent>(_fetchForecast);
    on<UpdateSelectedDayEvent>(_updateSelectedDay);
  }

  final CancelToken _cancelToken = CancelToken();

  void _fetchForecast(
    FetchForecastEvent event,
    Emitter<ForecastState> emit,
  ) async {
    emit(const ForecastState.fetchForecastLoading());
    final result = await _forecastRepo.fetchForecast(
      event.city,
      _cancelToken,
    );
    result.when(
      success: (forecastEntity) =>
          emit(ForecastState.fetchForecastSuccess(forecastEntity)),
      failure: (failure) =>
          emit(ForecastState.fetchForecastError(failure.error)),
    );
  }

  int selectedDay = 0;
  void _updateSelectedDay(
    UpdateSelectedDayEvent event,
    Emitter<ForecastState> emit,
  ) {
    if (selectedDay != event.selectedDay) {
      selectedDay = event.selectedDay;
      emit(ForecastState.updateSelectedDay(selectedDay));
    }
  }

  @override
  Future<void> close() {
    _cancelToken.cancel();
    return super.close();
  }
}
