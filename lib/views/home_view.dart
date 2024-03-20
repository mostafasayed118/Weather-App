import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/views/no_weather_body.dart';
import 'package:weather_app/views/result_weather_view.dart';
import 'package:weather_app/views/search_weather_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppString.appBarTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColor.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchView()));
              },
              icon: const Icon(
                Icons.search,
                color: AppColor.white,
              ),
            ),
          ],
          backgroundColor: AppColor.blue,
        ),
        body: const NoWeatherBody());
  }
}
// create states
// create cubit
// create functions
// provide cubit
// integrate cubit
// trigger cubit
