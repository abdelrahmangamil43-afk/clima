class WeatherModel {
  const WeatherModel({
    required this.temperature,
    required this.humidity,
    required this.conditionId,
    required this.cityName,
  });

  final int temperature;
  final int humidity;
  final int conditionId;
  final String cityName;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: (json['main']['temp'] as num).toInt(),
      humidity: (json['main']['humidity'] as num).toInt(),
      conditionId: json['weather'][0]['id'] as int,
      cityName: json['name'] as String,
    );
  }

  String get icon {
    if (conditionId < 300) {
      return '🌩';
    } else if (conditionId < 400) {
      return '🌧';
    } else if (conditionId < 600) {
      return '☔️';
    } else if (conditionId < 700) {
      return '☃️';
    } else if (conditionId < 800) {
      return '🌫';
    } else if (conditionId == 800) {
      return '☀️';
    } else if (conditionId <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String get message {
    if (temperature > 25) {
      return 'It\'s 🍦 time';
    } else if (temperature > 20) {
      return 'Time for shorts and 👕';
    } else if (temperature < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
