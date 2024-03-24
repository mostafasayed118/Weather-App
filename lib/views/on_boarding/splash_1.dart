import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/views/on_boarding/on_boarding_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/images/logo1.png'),
          const SizedBox(
            height: 20,
          ),
          // Text('NutriFix', style: TextStyle()),
        ]),
      ),
      nextScreen: const OnBoardingView(),
      splashIconSize: 500,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: const Color(0xff3dabe4),
    );
  }
}
