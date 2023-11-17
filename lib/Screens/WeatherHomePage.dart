import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/Screens/WeatherPage.dart';
import 'package:flutter_weather_app/Widget/ThereIsNoWeather.dart';
import 'package:flutter_weather_app/cubits/getWeatherCubit/getWeatherCubit.dart';
import 'package:flutter_weather_app/cubits/getWeatherCubit/getWeatherStates.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, State) {
      if (State is ThereIsNoWeatherState_InitialState_) {
        return const ThereIsNoWeather();
      } else if (State is WeatherLaodedState) {
        return WeatherPage(
          weatherModel: State.weatherModel,
        );
      } else {
        return Scaffold(
          backgroundColor: const Color(0xffb101322),
          appBar: AppBar(
              actions: [
                IconButton(
                    splashRadius: 30,
                    splashColor: Colors.orange.withOpacity(0.9),
                    onPressed: () {
                      Navigator.of(context).pushNamed("searchingPage");
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ))
              ],
              // toolbarHeight: 100,
              backgroundColor: Colors.black.withOpacity(0.7),
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Wea',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'ther',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          body: Stack(children: [
            Container(
              width: double.maxFinite,
              child: Image.asset(
                'assets/images/weather.gif',
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("There Was An Error ❌ ",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white.withOpacity(0.7))),
                      Text("!",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.orange.withOpacity(0.7))),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        );
      }
    });

    // return const ThereIsNoWeather();
    // return weatherModel == null ? const ThereIsNoWeather() : const WeatherPage();
  }
}
