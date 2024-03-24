// import 'package:fitness_workout_app_1/common_widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/app_assets.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/core/widget/normal_button.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/views/register/register_view.dart';

// import '../home/home_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppString.welcomeTitleScreen,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.primaryColor1,
                        fontSize: 22,
                        fontFamily: 'Khand',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.2,
                ),
                Lottie.asset(
                  AppAssets.animation,
                  width: 225,
                  height: 290,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: media.width * 0.01,
                ),
                Text(
                  AppString.welcome,
                  style: TextStyle(
                    color: AppColor.primaryColor2,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Khand',
                  ),
                ),
                Text(
                  AppString.welcomeSubTitleScreen,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Khand',
                  ),
                ),
                SizedBox(
                  height: media.width * 0.2,
                ),
                NormalButton(
                  textColor: AppColor.white,
                  text: AppString.goToHomeButton,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  },
                  backgroundColor: AppColor.primaryColor1,
                  widthSize: 330,
                  heightSize: 61,
                  borderColor: AppColor.primaryColor1,
                  fontSize: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
