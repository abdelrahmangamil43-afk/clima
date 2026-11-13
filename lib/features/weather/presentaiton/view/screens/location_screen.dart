import 'package:climaa/core/constant/constant.dart';
import 'package:climaa/core/theme/app_theme.dart';
import 'package:climaa/features/weather/presentaiton/view/screens/city_screen.dart';
import 'package:climaa/features/weather/presentaiton/view/widgets/weather_content.dart';
import 'package:climaa/features/weather/presentaiton/view_model/cubit/weather/weather_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  Future<void> _searchCity(BuildContext context) async {
    final cubit = context.read<WeatherCubit>();
    final typedName = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const CityScreen()),
    );
    if (typedName != null && typedName.trim().isNotEmpty) {
      cubit.getWeatherByCity(typedName.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: 0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () =>
                        context.read<WeatherCubit>().getWeatherByLocation(),
                    icon: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _searchCity(context),
                    icon: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                    return switch (state) {
                      WeatherSuccess(:final weather) => WeatherContent(
                        weather: weather,
                      ),
                      WeatherFailure(:final message) => Center(
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: kMessageTextStyle,
                        ),
                      ),
                      _ => const Center(
                        child: SpinKitDoubleBounce(
                          color: Colors.white,
                          size: 100.0,
                        ),
                      ),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
