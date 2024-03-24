import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_assets.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/core/widget/normal_button.dart';
import 'package:weather_app/views/login/login_view.dart';
import 'package:weather_app/views/register/register_view.dart';

import '../../core/utils/app_colors.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: media.width * 0.2,
                ),
                Image(
                    width: media.width * 0.9,
                    image: const AssetImage(AppAssets.createAccount)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: media.width * 0.4,
                      ),

                      NormalButton(
                        textColor: AppColor.white,
                        text: AppString.createAccount,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterView()));
                        },
                        backgroundColor: AppColor.primaryColor1,
                        widthSize: 330,
                        heightSize: 61,
                        borderColor: AppColor.primaryColor1,
                        fontSize: 30,
                      ),
                      SizedBox(
                        height: media.width * 0.06,
                      ),
                      NormalButton(
                        textColor: AppColor.primaryColor1,
                        text: AppString.login,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginView()));
                        },
                        backgroundColor: AppColor.white,
                        widthSize: 330,
                        heightSize: 61,
                        borderColor: AppColor.primaryColor1,
                        fontSize: 32,
                      ),

                      SizedBox(
                        height: media.width * 0.08,
                      ),

                      // ),
                      SizedBox(
                        height: media.width * 0.08,
                      ),

                      SizedBox(
                        height: media.width * 0.04,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
