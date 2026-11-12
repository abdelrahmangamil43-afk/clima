import 'package:flutter/material.dart';
import 'package:climaa/services/location.dart';
import 'package:climaa/services/networking.dart';
const apikey='d69b8eed9eba72f23c22fcf8316c5c5b';


class WeatherModel {
  Future<dynamic>  getCityWeather(String cityName) async{
    NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric');
    var weatherData=await networkHelper.getData();
    return weatherData;

  }

  Future<dynamic> getWeatherByCoordinates() async {
    try {
      print("location");
      Location location = Location();
      print("getcurrentlocation");
      bool getCurrentLocationStatus=await location.getCurrentLocation();
      if (getCurrentLocationStatus) {
        print("NetworkHelperStarts");
        NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
        var weatherData = await networkHelper.getData();
        return weatherData;
      }
    }
    catch(e){
      print("getlocation $e");
    }
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
