import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/Models/weatherModel.dart';
import 'package:flutter_weather_app/Services/WeatherServices.dart';
import 'package:flutter_weather_app/cubits/getWeatherCubit/getWeatherStates.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(ThereIsNoWeatherState_InitialState_());
 WeatherModel? weatherModel;
  fetchWeather({required String cityName}) async {
    try {
      weatherModel =
          await Weather_Services(Dio()).getWeather(cityName: cityName);
      emit(WeatherLaodedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
