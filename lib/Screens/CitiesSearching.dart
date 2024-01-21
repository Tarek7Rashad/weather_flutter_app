import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/cubits/getWeatherCubit/getWeatherCubit.dart';

class ShearchingWidget extends StatefulWidget {
  const ShearchingWidget({super.key});

  @override
  State<ShearchingWidget> createState() => _ShearchingWidgetState();
}

class _ShearchingWidgetState extends State<ShearchingWidget> {
  @override
  Widget build(BuildContext context) {
    // bool isLoading = true;

    // String? name;
    return Scaffold(
        backgroundColor: const Color(0xffb101322),
        appBar: AppBar(
            toolbarHeight: 100,
            // backgroundColor: Colors.black.withOpacity(0.7),
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Cities',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Searching',
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: TextFormField(
            onFieldSubmitted: (value) async {
              try {
                // weatherModel =
                //     await Weather_Services(Dio()).getWeather(cityName: value);
                // log(weatherModel?.cityName ?? 'OOPs');
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.fetchWeather(cityName: value);
                Navigator.pop(context);
                // Navigator.of(context).pushReplacementNamed('searchingPage');
              } catch (e) {
                log(e.toString());
                return null;
              }
            },
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "Search",
              labelStyle: const TextStyle(color: Colors.orange),
              prefixIcon: const Icon(Icons.search_rounded),
              prefixIconColor: Colors.grey,
              hintText: "Search Cities",
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.7), width: 0.2)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.orange),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ));
  }
}

// WeatherModel? weatherModel; // global weather model
