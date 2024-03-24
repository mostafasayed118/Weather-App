import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_strings.dart';

class RoundTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hitText;
  final String iconPath;
  final EdgeInsets? margin;
  final Widget? rightIcon;
  final bool obscureText;
  final Function(String)? onChanged;

  const RoundTextfield(
      {Key? key,
      this.controller,
      required this.hitText,
      required this.iconPath,
      this.margin,
      this.keyboardType,
      this.obscureText = false,
      this.rightIcon,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: AppColor.gray.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        validator: (data) {
          if (data == null || data.isEmpty) {
            return AppString.vallationMessage;
          }
        },
        cursorColor: AppColor.primaryColor1,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hitText,
          hintStyle: TextStyle(
            fontFamily: 'Hind',
            fontWeight: FontWeight.w700,
            color: AppColor.primaryColor1,
          ),
          suffixIcon: rightIcon,
          prefixIcon: Container(
            alignment: Alignment.center,
            width: 25,
            height: 25,
            child: Image.asset(
              iconPath,
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
          ),
          helperStyle: TextStyle(
            color: AppColor.gray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: 'Hind',
          ),
        ),
      ),
    );
  }
}
