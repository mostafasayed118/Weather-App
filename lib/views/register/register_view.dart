import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather_app/core/helper/show_snack_bar.dart';
import 'package:weather_app/core/utils/app_assets.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/core/widget/normal_button.dart';
import 'package:weather_app/core/widget/round_textfield.dart';
import 'package:weather_app/views/login/login_view.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/views/welcome_view.dart';

import '../../core/utils/app_colors.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isCheck = false;
  bool isLoading = false;

  String? email;
  String? userName;
  String? password;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
              child: Padding(
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
                      ),
                    ),
                    Text(
                      AppString.createAccount,
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
                    SizedBox(
                      height: media.width * 0.04,
                    ),
                    RoundTextfield(
                        hitText: AppString.userNameHint,
                        iconPath: AppAssets.userNameIcon,
                        onChanged: (data) {
                          userName = data;
                        }),
                    SizedBox(
                      height: media.width * 0.04,
                    ),
                    SizedBox(
                      height: media.width * 0.04,
                    ),
                    RoundTextfield(
                      hitText: AppString.emailHint,
                      iconPath: AppAssets.emailIcon,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    SizedBox(
                      height: media.width * 0.04,
                    ),
                    SizedBox(
                      height: media.width * 0.04,
                    ),
                    RoundTextfield(
                      onChanged: (data) {
                        password = data;
                      },
                      hitText: AppString.passwordHint,
                      obscureText: true,
                      iconPath: AppAssets.passwordIcon,
                      keyboardType: TextInputType.visiblePassword,
                      rightIcon: TextButton(
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: 22,
                          height: 22,
                          child: Image.asset(
                            AppAssets.passwordEyeIcon,
                            width: 22,
                            height: 22,
                            fit: BoxFit.contain,
                            color: AppColor.gray,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.2,
                    ),
                    NormalButton(
                      textColor: AppColor.white,
                      text: AppString.register,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});

                          formKey.currentState!.save();
                          try {
                            await registerUser();
                            showSnackBar(context, AppString.successMessage);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomeView(),
                              ),
                            );
                          } on FirebaseAuthException catch (ex) {
                            if (ex.code == 'weak-password') {
                              (context, AppString.weekPasswordMessage);
                            } else if (ex.code == 'email-already-in-use') {
                              showSnackBar(
                                  context, AppString.emailAlreadyInUseMessage);
                            } else if (ex.code == 'invalid-email') {
                              showSnackBar(
                                  context, AppString.invalidEmailMessage);
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
                      height: media.width * 0.1,
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
                          AppString.or,
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
                      height: media.width * 0.1,
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
                          onTap: () {
                            //facebook register
                          },
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
                          onTap: () {
                            //x register
                          },
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
                                builder: (context) => LoginView()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppString.alreadyHaveAccount,
                            style: TextStyle(
                              color: AppColor.primaryColor1,
                              fontSize: 14,
                              fontFamily: 'Hind',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            AppString.login,
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
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      password: password!,
      email: email!,
    );
  }
}
