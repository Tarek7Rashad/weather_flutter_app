import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/Models/weatherModel.dart';
// import 'package:flutter_weather_app/Models/weatherModel.dart';
import 'package:flutter_weather_app/cubits/getWeatherCubit/getWeatherCubit.dart';
import 'package:flutter_weather_app/main.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    String period = (weatherModel.date.hour < 12) ? 'AM' : 'PM';
    int hour = weatherModel.date.hour;
    int minute = weatherModel.date.minute;
    if (hour > 12) {
      hour -= 12;
    }
    return Scaffold(
      backgroundColor: const Color(0xffb101322),
      appBar: AppBar(
          actions: [
            IconButton(
              splashRadius: 30,
              splashColor: Colors.orange.withOpacity(0.9),
              onPressed: () {
                Navigator.of(context).pushNamed('searchingPage');
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ],
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            getMaterialColor(weatherModel.weatherCondition),
            getMaterialColor(weatherModel.weatherCondition)[100]!,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  weatherModel.cityName,
                  style: TextStyle(
                      fontSize: 32, color: Colors.white.withOpacity(0.7)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "updated at ",
                      style: TextStyle(
                          fontSize: 20, color: Colors.white.withOpacity(0.7)),
                    ),
                    Text(
                      "$hour:$minute $period",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.orange),
                    ),
                    // Text(
                    //   "${weatherModel.date.hour}:${weatherModel.date.minute} $period",
                    //   style: const TextStyle(fontSize: 20, color: Colors.orange),
                    // ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Image.asset('assets/images/rainy.png'),
                  !weatherModel.image!.contains("https:")
                      ? Image.network('https:${weatherModel.image}')
                      : Image.asset(
                          'assets/images/weatherConditions-removebg-preview.png',
                          width: 100,
                          height: 100,
                        ),
                  // Image.network('https:${weatherModel.image!}'),

                  Text(
                    "${weatherModel.aveTemp.round()}",
                    style: TextStyle(
                        fontSize: 30, color: Colors.white.withOpacity(0.7)),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Maxtemp : ',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          Text(
                            ("${weatherModel.maxTemp.round()}"),
                            style: const TextStyle(
                                fontSize: 18, color: Colors.orange),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Mintemp : ',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          Text(
                            ("${weatherModel.minTemp.round()}"),
                            style: const TextStyle(
                                fontSize: 18, color: Colors.orange),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              weatherModel.weatherCondition,
              style:
                  TextStyle(fontSize: 32, color: Colors.white.withOpacity(0.7)),
            ),
          ],
        ),
      ),
    );
  }
}
