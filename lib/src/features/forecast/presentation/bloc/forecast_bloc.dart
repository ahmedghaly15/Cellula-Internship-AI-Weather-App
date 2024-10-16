import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/labeled_circular_percent_attributes.dart';
import 'package:internship_ai_weather_app/src/features/forecast/domain/repositories/forecast_repo.dart';
import 'package:internship_ai_weather_app/src/features/forecast/domain/usecases/tennis_play_prediction.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_event.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final ForecastRepo _forecastRepo;
  final TennisPlayPredictionUseCase _tennisPlayPredictionUseCase;

  ForecastBloc(this._forecastRepo, this._tennisPlayPredictionUseCase)
      : super(const ForecastState.initial()) {
    on<FetchForecastEvent>(_fetchForecast);
    on<UpdateSelectedDayEvent>(_updateSelectedDay);
    on<TennisPlayPrediction>(_tennisPlayPrediction);
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

  void _tennisPlayPrediction(
    TennisPlayPrediction event,
    Emitter<ForecastState> emit,
  ) async {
    emit(const ForecastState.tennisPlayPredictionLoading());
    final result = await _tennisPlayPredictionUseCase(
      event.current,
      _cancelToken,
    );
    result.when(
      success: (tennisPlayPredictionResponse) => emit(
        ForecastState.tennisPlayPredictionSuccess(tennisPlayPredictionResponse),
      ),
      failure: (failure) =>
          emit(ForecastState.tennisPlayPredictionError(failure.error)),
    );
  }

  List<LabeledCircularPercentAttributes> forecastIndicatorsAttributes(
    List<ForecastDay> forecastDays,
  ) =>
      [
        LabeledCircularPercentAttributes(
          label: 'Max temp (°C)',
          percent: forecastDays[selectedDay].day.maxTempC / 100,
        ),
        LabeledCircularPercentAttributes(
          label: 'Min temp (°C)',
          percent: forecastDays[selectedDay].day.minTempC / 100,
        ),
        LabeledCircularPercentAttributes(
          label: 'Average temp (°C)',
          percent: forecastDays[selectedDay].day.avgTempC / 100,
        ),
        LabeledCircularPercentAttributes(
          label: 'Max Wind (km/h)',
          percent: forecastDays[selectedDay].day.maxWindKph / 100,
        )
      ];

  @override
  Future<void> close() {
    _cancelToken.cancel();
    return super.close();
  }
}
