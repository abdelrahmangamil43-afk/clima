part of 'weather_cubit.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherSuccess extends WeatherState {
  const WeatherSuccess(this.weather);
  final WeatherModel weather;

  @override
  List<Object?> get props => [weather];
}

class WeatherFailure extends WeatherState {
  const WeatherFailure(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
