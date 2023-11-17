class WeatherModel {
  final String cityName;
  final double maxTemp;
  final double minTemp;
  final double aveTemp;
  final String weatherCondition;
  final DateTime date;
  final String? image;

  const WeatherModel(
      {required this.aveTemp,
      required this.weatherCondition,
      required this.date,
      required this.image,
      required this.cityName,
      required this.maxTemp,
      required this.minTemp});
  factory WeatherModel.jsonData(json) {
    return WeatherModel(
        aveTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        date: DateTime.parse(json['current']['last_updated']),
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c']);
  }
}
