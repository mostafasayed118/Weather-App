import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theme/get_theme_color.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/views/search_weather_view.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.descriptionWeather),
            getThemeColor(weatherModel.descriptionWeather)[400]!,
            getThemeColor(weatherModel.descriptionWeather)[200]!,
            getThemeColor(weatherModel.descriptionWeather)[100]!,
            getThemeColor(weatherModel.descriptionWeather)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                weatherModel.cityName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColor.black,
                ),
              ),
            ),
            Text(
              "Updated on ${weatherModel.date.hour}:${weatherModel.date.minute}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: AppColor.black,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image.asset('assets/images/rainy.png'),
                Image.network(
                  "https:${weatherModel.image}",
                  width: 100,
                  height: 100,
                ),
                Text(
                  weatherModel.temp.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "MaxTemp ${weatherModel.maxTemp.round()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "MinTemp ${weatherModel.minTemp.round()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              weatherModel.descriptionWeather,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
