import 'package:climaa/core/network/api_result.dart';
import 'package:climaa/core/utils/location_helper.dart';
import 'package:climaa/features/weather/data/api/weather_api.dart';
import 'package:climaa/features/weather/data/models/weather_model.dart';
import 'package:climaa/features/weather/data/repo/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo {
  WeatherRepoImpl(this._api, this._locationHelper);
  final WeatherApi _api;
  final LocationHelper _locationHelper;

  @override
  Future<ApiResult<WeatherModel>> getWeatherByLocation() async {
    try {
      final position = await _locationHelper.getCurrentPosition();
      return await _api.getWeatherByCoordinates(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      return ApiError<WeatherModel>(e.toString());
    }
  }

  @override
  Future<ApiResult<WeatherModel>> getWeatherByCity(String cityName) {
    return _api.getWeatherByCity(cityName);
  }
}
