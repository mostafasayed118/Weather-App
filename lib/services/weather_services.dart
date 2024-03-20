import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
  final Dio dio;
  static String baseUrl = "https://api.weatherapi.com/v1";
  static String apiKey = "9df576b269dd4c2780b185656240903";

  WeatherServices(this.dio);
  //https://api.weatherapi.com/v1/forecast.json?key=9df576b269dd4c2780b185656240903&q=Cairo&days=1

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          "oops something went wrong,try again later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops something went wrong,try again later');
    }
  }
}
