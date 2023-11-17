import 'package:flutter/material.dart';

class ThereIsNoWeather extends StatelessWidget {
  const ThereIsNoWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Searching To Find The 🧐 ",
                      style: TextStyle(
                          fontSize: 28, color: Colors.white.withOpacity(0.7))),
                  Text("Weather",
                      style: TextStyle(
                          fontSize: 30, color: Colors.orange.withOpacity(0.7))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("For A Specific  ",
                      style: TextStyle(
                          fontSize: 30, color: Colors.white.withOpacity(0.7))),
                  Text("Country 🔍",
                      style: TextStyle(
                          fontSize: 30, color: Colors.orange.withOpacity(0.7))),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
