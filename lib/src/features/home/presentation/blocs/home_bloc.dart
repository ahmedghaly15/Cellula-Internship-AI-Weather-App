import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:internship_ai_weather_app/src/features/home/domain/repositories/home_repo.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_event.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo _homeRepo;

  HomeBloc(this._homeRepo) : super(const HomeState.initial()) {
    on<EnableLocationPermissionEvent>(_enableLocationPermission);
    on<FetchCityDataEvent>(_fetchCityData);
    on<FetchCurrentEvent>(_fetchCurrent);
    cityController = TextEditingController();
  }

  late final TextEditingController cityController;
  final CancelToken _cancelToken = CancelToken();

  void _enableLocationPermission(
    EnableLocationPermissionEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.enableLocationPermissionLoading());
    final locationPermission = await Geolocator.requestPermission();
    if (_isLocationGranted(locationPermission)) {
      emit(HomeState.enableLocationPermissionSuccess(locationPermission));
    } else {
      emit(const HomeState.enableLocationPermissionError());
    }
  }

  bool _isLocationGranted(LocationPermission locationPermission) =>
      locationPermission == LocationPermission.always ||
      locationPermission == LocationPermission.whileInUse;

  void _fetchCityData(
    FetchCityDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.fetchCityDataLoading());
    final result = await _homeRepo.fetchCityData(event.params, _cancelToken);
    result.when(
      success: (cityDataEntity) =>
          emit(HomeState.fetchCityDataSuccess(cityDataEntity)),
      failure: (failure) => emit(HomeState.fetchCityDataError(failure.error)),
    );
  }

  void _fetchCurrent(
    FetchCurrentEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.fetchCurrentLoading());
    final result = await _homeRepo.fetchCurrent(
      cityController.text.trim(),
      _cancelToken,
    );
    result.when(
      success: (currentEntity) =>
          emit(HomeState.fetchCurrentSuccess(currentEntity)),
      failure: (failure) => emit(HomeState.fetchCurrentError(failure.error)),
    );
  }

  @override
  Future<void> close() {
    cityController.dispose();
    _cancelToken.cancel();
    return super.close();
  }
}
