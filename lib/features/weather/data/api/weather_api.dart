import 'package:climaa/core/constant/api_constant.dart';
import 'package:climaa/core/constant/secrets.dart';
import 'package:climaa/core/network/api_client.dart';
import 'package:climaa/core/network/api_result.dart';
import 'package:climaa/features/weather/data/models/weather_model.dart';

class WeatherApi {
  WeatherApi(this._client);
  final ApiClient _client;

  Future<ApiResult<WeatherModel>> getWeatherByCoordinates(
    double lat,
    double lon,
  ) {
    return _fetch({'lat': '$lat', 'lon': '$lon'});
  }

  Future<ApiResult<WeatherModel>> getWeatherByCity(String cityName) {
    return _fetch({'q': cityName});
  }

  Future<ApiResult<WeatherModel>> _fetch(Map<String, String> query) async {
    final uri =
        Uri.parse(
          '${ApiConstant.baseUrl}${ApiConstant.weatherEndpoint}',
        ).replace(
          queryParameters: {
            ...query,
            'appid': Secrets.apiKey,
            'units': 'metric',
          },
        );

    final result = await _client.get(uri);
    return switch (result) {
      ApiSuccess(:final data) => ApiSuccess<WeatherModel>(
        WeatherModel.fromJson(data),
      ),
      ApiError(:final message) => ApiError<WeatherModel>(message),
    };
  }
}
