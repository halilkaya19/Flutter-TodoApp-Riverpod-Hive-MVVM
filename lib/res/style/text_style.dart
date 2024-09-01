import 'package:flutter/material.dart';
import 'package:riverpod_hive_todoapp_full_1/res/color.dart';

class AppStyle {

  static AppStyle instance = AppStyle._init();

  AppStyle._init();

  final TextStyle appbarStyle = const TextStyle(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.w700
  );

  final TextStyle h2Bold = const TextStyle(
    color: AppColors.whiteColor,
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );

  final TextStyle h4Bold = const TextStyle(
    color: AppColors.whiteColor,
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  final TextStyle h5Bold = const TextStyle(
    color: AppColors.whiteColor,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  final TextStyle bodyXLarge = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  final TextStyle bodyMedium = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
