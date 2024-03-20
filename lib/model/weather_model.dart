class WeatherModel {
  final String cityName;
  final String date;
  final String image;
  final double temp;
  final String descriptionWeather;
  final double minTemp;
  final double maxTemp;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.temp,
      required this.descriptionWeather,
      required this.minTemp,
      required this.maxTemp});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      // temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'].toString(),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      descriptionWeather: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      // minTemp:
      //     json['forecast']['forecastday'][0]['day']['mintemp_c'].toString(),
      // maxTemp:
      //     json['forecast']['forecastday'][0]['day']['maxtemp_c'].toString(),
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
    );
  }
}
