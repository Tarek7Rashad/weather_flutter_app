import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/Screens/CitiesSearching.dart';
import 'package:flutter_weather_app/Screens/WeatherHomePage.dart';
import 'package:flutter_weather_app/Widget/ThereIsNoWeather.dart';
import 'package:flutter_weather_app/cubits/getWeatherCubit/getWeatherCubit.dart';
import 'package:flutter_weather_app/cubits/getWeatherCubit/getWeatherStates.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                    primarySwatch: getMaterialColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                )),
                debugShowCheckedModeBanner: false,
                home: const HomePage(),
                routes: {
                  "searchingPage": (context) => const ShearchingWidget(),
                  "thereIsNoWeatherPage": (context) => const ThereIsNoWeather(),
                  
                },
              );
            },
          ),
        ));
  }
}

MaterialColor getMaterialColor(String? condition) {
  if (condition == null) {
    return Colors.blueGrey;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
      return Colors.brown;
    case "mist":
    case "partly cloudy":
      return Colors.blueGrey;
    case "thundery outbreaks possible":
      return Colors.deepPurple;
    case "blowing snow":
    case "fog":
    case "blizzard":
    case "freezing fog":
    case "cloudy":
    case "overcast":
      return Colors.grey;
    case "patchy light drizzle":
    case "light drizzle":
    case "freezing drizzle":
    case "heavy freezing drizzle":
    case "patchy light rain":
    case "light rain":
    case "moderate rain at times":
    case "moderate rain":
    case "heavy rain at times":
    case "heavy rain":
    case "light freezing rain":
    case "moderate or heavy freezing rain":
    case "light sleet":
    case "moderate or heavy sleet":
    case "patchy light snow":
    case "light snow":
    case "patchy moderate snow":
    case "moderate snow":
    case "patchy heavy snow":
    case "heavy snow":
    case "ice pellets":
    case "light rain shower":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
    case "light sleet showers":
    case "moderate or heavy sleet showers":
    case "light snow showers":
    case "moderate or heavy snow showers":
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
    case "patchy rain possible":
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy freezing drizzle possible":
      return Colors.lightBlue;
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return Colors.deepPurple;
    default:
      return Colors.blueGrey;
  }
}
