import 'package:climaa/core/network/api_client.dart';
import 'package:climaa/core/utils/location_helper.dart';
import 'package:climaa/features/weather/data/api/weather_api.dart';
import 'package:climaa/features/weather/data/repo/weather_repo_impl.dart';
import 'package:climaa/features/weather/presentaiton/view/screens/loading_screen.dart';
import 'package:climaa/features/weather/presentaiton/view_model/cubit/weather/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit(
        WeatherRepoImpl(WeatherApi(ApiClient()), LocationHelper()),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const LoadingScreen(),
      ),
    );
  }
}
