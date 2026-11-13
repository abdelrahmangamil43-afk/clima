import 'package:climaa/features/weather/presentaiton/view/screens/location_screen.dart';
import 'package:climaa/features/weather/presentaiton/view_model/cubit/weather/weather_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().getWeatherByLocation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherCubit, WeatherState>(
      listenWhen: (_, current) =>
          current is WeatherSuccess || current is WeatherFailure,
      listener: (context, state) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LocationScreen()),
        );
      },
      child: const Scaffold(
        body: Center(
          child: SpinKitDoubleBounce(color: Colors.white, size: 100.0),
        ),
      ),
    );
  }
}
