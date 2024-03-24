import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_colors.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColor.primaryColor1,
      content: Text(
        message,
      ),
    ),
  );
}
