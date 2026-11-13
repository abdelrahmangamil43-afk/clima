import 'package:climaa/core/network/api_result.dart';
import 'package:climaa/features/weather/data/models/weather_model.dart';
import 'package:climaa/features/weather/data/repo/weather_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._repo) : super(const WeatherInitial());
  final WeatherRepo _repo;

  Future<void> getWeatherByLocation() async {
    emit(const WeatherLoading());
    _emitResult(await _repo.getWeatherByLocation());
  }

  Future<void> getWeatherByCity(String cityName) async {
    emit(const WeatherLoading());
    _emitResult(await _repo.getWeatherByCity(cityName));
  }

  void _emitResult(ApiResult<WeatherModel> result) {
    switch (result) {
      case ApiSuccess(:final data):
        emit(WeatherSuccess(data));
      case ApiError(:final message):
        emit(WeatherFailure(message));
    }
  }
}
