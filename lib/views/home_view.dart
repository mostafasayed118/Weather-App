import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/theme/get_theme_color.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/no_weather_body.dart';
import 'package:weather_app/views/weather_info_body.dart';
import 'package:weather_app/views/search_weather_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor:
            BlocProvider.of<GetWeatherCubit>(context).weatherModel == null
                ? AppColor.blue
                : getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel!
                    .descriptionWeather),
        title: Text(
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchView()));
            },
            icon: const Icon(
              Icons.search,
              color: AppColor.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else {
            return const Text('Oops! Something went wrong. Please try again.');
          }
        },
      ),
    );
  }
}
// create states
// create cubit
// create functions
// provide cubit
// integrate cubit
// trigger cubit
