import 'package:flutter/material.dart';
import 'package:weather_app/core/widget/normal_button.dart';
import 'package:weather_app/core/widget/round_textfield.dart';
import 'package:weather_app/login/login_view.dart';
import 'package:weather_app/views/home_view.dart';

import '../core/utils/app_colors.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
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
                  ),
                ),
                Text(
                  "Create An Account",
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Hind',
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                const RoundTextfield(
                  hitText: 'First Name',
                  iconPath: 'assets/images/collaborator_male.png',
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const RoundTextfield(
                  hitText: 'Last Name',
                  iconPath: 'assets/images/collaborator_male.png',
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const RoundTextfield(
                  hitText: 'Phone Number',
                  iconPath: 'assets/images/Phone.png',
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const RoundTextfield(
                  hitText: 'Email',
                  iconPath: 'assets/images/Envelope.png',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),

                const RoundTextfield(
                  hitText: 'Country',
                  iconPath: 'assets/images/country.png',
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const RoundTextfield(
                  hitText: 'User Name',
                  iconPath: 'assets/images/collaborator_male.png',
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
                      width: 22,
                      height: 22,
                      child: Image.asset(
                        'assets/images/Eye.png',
                        width: 22,
                        height: 22,
                        fit: BoxFit.contain,
                        color: AppColor.gray,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextfield(
                  hitText: 'Confirm Password',
                  obscureText: true,
                  iconPath: 'assets/images/Lock.png',
                  keyboardType: TextInputType.visiblePassword,
                  rigticon: TextButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 22,
                      height: 22,
                      child: Image.asset(
                        'assets/images/Eye.png',
                        width: 22,
                        height: 22,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: Icon(
                        isCheck
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined,
                        color: AppColor.gray,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'by continuing you agree to our\nterms of service and with our privacy policy ',
                        style: TextStyle(
                            color: AppColor.gray,
                            fontFamily: 'Hind',
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                SizedBox(
                  height: media.width * 0.1,
                ),

                NormalButton(
                  textColor: AppColor.white,
                  text: 'Register',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                  },
                  backgroundColor: AppColor.primaryColor1,
                  widthSize: 330,
                  heightSize: 61,
                  borderColor: AppColor.primaryColor1,
                  fontSize: 32,
                ),
                // RoundButton(
                //   title: "Register",
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const CompleteProfileView()));
                //   },
                //   fontSize: 32,
                //   fontWeight: FontWeight.w700, elevation: 0,
                // ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        color: AppColor.primaryColor1.withOpacity(1),
                      ),
                    ),
                    Text(
                      '  Or  ',
                      style: TextStyle(
                        color: AppColor.primaryColor2,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Hind',
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        color: AppColor.primaryColor1.withOpacity(1),
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
                      onTap: () {
                        //google register
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
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
                      onTap: () {
                        //facebook register
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
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
                      onTap: () {
                        //x register
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
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
                            builder: (context) => const LoginView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Alredy have an account? ',
                        style: TextStyle(
                          color: AppColor.primaryColor1,
                          fontSize: 14,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                          color: AppColor.primaryColor2,
                          fontSize: 16,
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
