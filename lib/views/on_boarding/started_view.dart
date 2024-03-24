import 'package:flutter/material.dart';

import 'package:slide_to_act/slide_to_act.dart';
import 'package:weather_app/core/utils/app_colors.dart';
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
                  'Welcome In',
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
                Text(
                  'NutriFix',
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset('assets/images/o1.jpg'),
                const Spacer(
                  flex: 1,
                ),
                SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Stack(
                        children: [
                          SlideAction(
                            child: NormalButton(
                              textColor: TColor.white,
                              text: 'Get Started',
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
                              'assets/images/arrow.png',
                              height: 25,
                            ),
                            // text: 'Get Started',
                            // textColor: Colors.red,
                            // textStyle: const TextStyle(
                            //   fontSize: 24,
                            //   fontFamily: 'Khand',
                            //   fontWeight: FontWeight.bold,
                            // ),
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
