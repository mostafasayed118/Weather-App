import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_colors.dart';

class OnBoardingPage extends StatelessWidget {
  final Map pageObject;
  const OnBoardingPage({Key? key, required this.pageObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            pageObject['image'].toString(),
            width: media.width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: media.width * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              pageObject['title'].toString(),
              style: TextStyle(
                color: AppColor.primaryColor4,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text(
              pageObject['subtitle'].toString(),
              style: TextStyle(
                color: AppColor.primaryColor1,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Hind',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
