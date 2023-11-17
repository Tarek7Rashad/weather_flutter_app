import 'package:flutter_weather_app/Models/weatherModel.dart';

class WeatherState {}

// ignore: camel_case_types
class ThereIsNoWeatherState_InitialState_ extends WeatherState {}

class WeatherLaodedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLaodedState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {}
