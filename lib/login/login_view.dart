import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/widget/blank_widget.dart';
import 'package:weather_app/core/widget/normal_button.dart';
import 'package:weather_app/core/widget/round_textfield.dart';
import 'package:weather_app/login/register_view.dart';
import 'package:weather_app/views/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                  height: media.width * 0.06,
                ),
                Text(
                  "Hey there,",
                  style: TextStyle(
                      color: AppColor.primaryColor2,
                      fontSize: 16,
                      fontFamily: 'Hind',
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Hind',
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                SizedBox(
                  height: media.width * 0.08,
                ),
                const RoundTextfield(
                  hitText: 'Email',
                  iconPath: 'assets/images/Envelope.png',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextfield(
                  hitText: 'Password',
                  obscureText: true,
                  iconPath: 'assets/images/Lock.png',
                  keyboardType: TextInputType.visiblePassword,
                  rigticon: TextButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        'assets/images/show_password.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        color: AppColor.gray,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BlankWidget()));
                      },
                      child: Text(
                        "Forgot Your Password?",
                        style: TextStyle(
                          color: AppColor.primaryColor2,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Hind',
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.4,
                ),
                // const Spacer(),
                NormalButton(
                  textColor: AppColor.white,
                  text: 'Login',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()));
                  },
                  backgroundColor: AppColor.primaryColor1,
                  widthSize: 330,
                  heightSize: 61,
                  borderColor: AppColor.primaryColor1,
                  fontSize: 32,
                ),

                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        color: AppColor.primaryColor1.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      ' Or ',
                      style: TextStyle(
                          color: AppColor.primaryColor2,
                          fontSize: 14,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        color: AppColor.primaryColor1.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColor.white,
                        ),
                        child: Image.asset(
                          'assets/images/google1.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColor.white,
                        ),
                        child: Image.asset(
                          'assets/images/facebook1.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColor.white,
                        ),
                        child: Image.asset(
                          'assets/images/x.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don't have an account yet? ",
                        style: TextStyle(
                            color: AppColor.primaryColor1,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Hind'),
                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                          color: AppColor.primaryColor2,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Hind',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
