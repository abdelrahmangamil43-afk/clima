import 'package:climaa/core/constant/constant.dart';
import 'package:climaa/core/theme/app_theme.dart';
import 'package:climaa/features/weather/data/models/weather_model.dart';
import 'package:climaa/features/weather/presentaiton/view/widgets/humidity_card.dart';

import 'package:flutter/material.dart';

class WeatherContent extends StatelessWidget {
  const WeatherContent({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${weather.temperature}°', style: kTempTextStyle),
                      Text(weather.icon, style: kConditionTextStyle),
                    ],
                  ),
                  const SizedBox(height: 20),
                  HumidityCard(humidity: weather.humidity),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Text(
            '${weather.message} in ${weather.cityName}',
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
