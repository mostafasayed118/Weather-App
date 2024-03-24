import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_assets.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/core/widget/on_boarding_page.dart';
import 'package:weather_app/views/on_boarding/create_acc.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;

      setState(() {});
    });
  }

  List pageArea = [
    {
      "title": AppString.titleOne,
      "subtitle": AppString.subTitleOne,
      "image": AppAssets.onboarding1
    },
    {
      "title": AppString.titleTwo,
      "subtitle": AppString.subTitleTwo,
      "image": AppAssets.onboarding2
    },
    {
      "title": AppString.titleThree,
      "subtitle": AppString.subTitleThree,
      "image": AppAssets.onboarding3
    },
  ];
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(alignment: Alignment.bottomRight, children: [
        PageView.builder(
          controller: controller,
          itemCount: pageArea.length,
          itemBuilder: (context, index) {
            var pageObject = pageArea[index] as Map? ?? {};

            return OnBoardingPage(pageObject: pageObject);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                child: const Text(
                  AppString.skip,
                  style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateAccount()));
                },
              ),
            ),
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      color: AppColor.primaryColor1,
                      value: (selectPage + 1) / 3,
                      strokeWidth: 2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor1,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.navigate_next,
                        color: AppColor.white,
                      ),
                      onPressed: () {
                        if (selectPage < 2) {
                          selectPage = selectPage + 1;
                          controller.animateToPage(selectPage,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastEaseInToSlowEaseOut);

                          // controller.jumpToPage(selectPage);
                        } else {
                          //open welcome Screen
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CreateAccount()));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
