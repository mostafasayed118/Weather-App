import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          AppString.appBarTitleSearch,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: AppColor.white,
          ),
        ),
        backgroundColor: AppColor.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: value);
              // log(weatherModel.cityName);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              labelText: AppString.searchLabel,
              hintText: AppString.searchHint,
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: AppColor.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
