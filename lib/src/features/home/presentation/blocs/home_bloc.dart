import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internship_ai_weather_app/src/core/helpers/debouncer.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/features/home/domain/repositories/home_repo.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_event.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo _homeRepo;

  HomeBloc(this._homeRepo) : super(const HomeState.initial()) {
    on<EnableLocationPermissionEvent>(_enableLocationPermission);
    on<FetchCityDataUsingPositionEvent>(_fetchCityDataUsingPosition);
    on<FetchCityDataUsingCityNameEvent>(_fetchCityDataUsingCityName);
    _initVariables();
  }

  void _initVariables() {
    cityController = TextEditingController();
    _debouncer = Debouncer(duration: const Duration(milliseconds: 500));
  }

  late final TextEditingController cityController;
  late final Debouncer _debouncer;
  final CancelToken _cancelToken = CancelToken();

  void _enableLocationPermission(
    EnableLocationPermissionEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.enableLocationPermissionLoading());
    final locationPermission = await Geolocator.requestPermission();
    if (_isLocationGranted(locationPermission)) {
      final Position position = await Geolocator.getCurrentPosition();
      emit(HomeState.enableLocationPermissionSuccess(position));
    } else {
      emit(const HomeState.enableLocationPermissionError());
    }
  }

  bool _isLocationGranted(LocationPermission locationPermission) =>
      locationPermission == LocationPermission.always ||
      locationPermission == LocationPermission.whileInUse;

  void _fetchCityDataUsingPosition(
    FetchCityDataUsingPositionEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.fetchCityDataUsingPositionLoading());
    final result = await _homeRepo.fetchCityDataUsingPosition(
      event.params,
      _cancelToken,
    );
    result.when(
      success: (cityDataEntity) {
        if (cityDataEntity.cityName != null &&
            cityController.text.trim() != cityDataEntity.cityName) {
          cityController.text = cityDataEntity.cityName!;
        }
        emit(HomeState.fetchCityDataUsingPositionSuccess(cityDataEntity));
      },
      failure: (failure) =>
          emit(HomeState.fetchCityDataUsingPositionError(failure.error)),
    );
  }

  void _fetchCityDataUsingCityName(
    FetchCityDataUsingCityNameEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.fetchCityDataUsingCityNameLoading());
    final result = await _homeRepo.fetchCityDataUsingCityName(
      event.cityName,
      _cancelToken,
    );
    result.when(
      success: (cityDataEntity) =>
          emit(HomeState.fetchCityDataUsingCityNameSuccess(cityDataEntity)),
      failure: (failure) =>
          emit(HomeState.fetchCityDataUsingCityNameError(failure.error)),
    );
  }

  void debouncedCitySearch(String city) {
    if (city.isNullOrEmpty == false) {
      _debouncer.run(() {
        add(FetchCityDataUsingCityNameEvent(city));
      });
    }
  }

  @override
  Future<void> close() {
    cityController.dispose();
    _cancelToken.cancel();
    return super.close();
  }
}
