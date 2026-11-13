import 'package:climaa/core/network/api_result.dart';
import 'package:climaa/features/weather/data/models/weather_model.dart';

abstract class WeatherRepo {
  Future<ApiResult<WeatherModel>> getWeatherByLocation();
  Future<ApiResult<WeatherModel>> getWeatherByCity(String cityName);
}
