import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather_app/core/helper/show_snack_bar.dart';
import 'package:weather_app/core/utils/app_assets.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/core/widget/blank_widget.dart';
import 'package:weather_app/core/widget/normal_button.dart';
import 'package:weather_app/core/widget/round_textfield.dart';
import 'package:weather_app/views/register/register_view.dart';
import 'package:weather_app/views/home_view.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isCheck = false;
  bool isLoading = false;

  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                      AppString.heyThere,
                      style: TextStyle(
                          color: AppColor.primaryColor2,
                          fontSize: 16,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      AppString.loginTitle,
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
                    RoundTextfield(
                      onChanged: (data) {
                        email = data;
                      },
                      hitText: AppString.emailHint,
                      iconPath: AppAssets.emailIcon,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: media.width * 0.04,
                    ),

                    RoundTextfield(
                      onChanged: (data) {
                        password = data;
                      },
                      hitText: AppString.passwordHint,
                      obscureText: isCheck,
                      iconPath: AppAssets.passwordIcon,
                      keyboardType: TextInputType.visiblePassword,
                      rightIcon: TextButton(
                        onPressed: () {
                          setState(() {
                            isCheck = !isCheck;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            AppAssets.passwordEyeIcon,
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: AppColor.primaryColor2,
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
                            AppString.forgotPassword,
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
                      text: AppString.login,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});

                          formKey.currentState!.save();
                          try {
                            await loginUser();
                            showSnackBar(context, AppString.successLogin);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ),
                            );
                          } on FirebaseAuthException catch (ex) {
                            if (ex.code == 'user-not-found') {
                              (context, AppString.userNotFound);
                            } else if (ex.code == 'wrong-password') {
                              showSnackBar(context, AppString.wrongPassword);
                            }
                          } catch (ex) {
                            showSnackBar(context, AppString.errorMessage);
                          }
                        } else
                          showSnackBar(context, AppString.vallationMessage);

                        isLoading = false;
                        setState(() {});
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
                          AppString.or,
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
                              AppAssets.googleIcon,
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
                              AppAssets.facebookIcon,
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
                              AppAssets.twitterIcon,
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
                            AppString.dontHaveAccount,
                            style: TextStyle(
                                color: AppColor.primaryColor1,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Hind'),
                          ),
                          Text(
                            AppString.register,
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
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      password: password!,
      email: email!,
    );
  }
}
