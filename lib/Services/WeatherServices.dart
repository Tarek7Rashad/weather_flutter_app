import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_weather_app/Models/weatherModel.dart';

class Weather_Services {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'd6d52495554440c9b42103753231311';
  Weather_Services(this.dio);
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.jsonData(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? "SomeThing Went Wrong";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("SomeThing Went Wrong, Try Later");
    }
  }
}
