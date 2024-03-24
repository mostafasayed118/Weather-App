import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:slide_to_act/slide_to_act.dart';
import 'package:weather_app/core/utils/app_assets.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/core/utils/colo_extension.dart';
import 'package:weather_app/core/widget/normal_button.dart';
import 'package:weather_app/views/on_boarding/on_boarding_view.dart';

class StartedView extends StatefulWidget {
  const StartedView({Key? key}) : super(key: key);

  @override
  _StartedViewState createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SizedBox(
          width: media.width,
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Text(
                  AppString.welcomeIn,
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppString.weatherZ,
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.3,
                ),
                Lottie.asset(
                  AppAssets.animation_get_started,
                  width: 225,
                  height: 290,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: media.width * 0.2,
                ),
                SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Stack(
                        children: [
                          SlideAction(
                            onSubmit: () {
                              //Go to next screen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OnBoardingView()));
                            },

                            sliderRotate: false,

                            borderRadius: 30,
                            elevation: 0,
                            outerColor: TColor.primaryColor4,
                            innerColor: Colors.white,
                            // innerColor: TColor.primaryColor1,

                            sliderButtonIcon: Image.asset(
                              AppAssets.arrow,
                              height: 25,
                            ),
                            child: NormalButton(
                              textColor: TColor.white,
                              text: AppString.getStarted,
                              onPressed: () {
                                //Go to next screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const OnBoardingView(),
                                  ),
                                );
                              },
                              backgroundColor: TColor.primaryColor1,
                              widthSize: 344,
                              heightSize: 70,
                              borderColor: TColor.primaryColor1,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
