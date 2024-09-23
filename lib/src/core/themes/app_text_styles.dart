import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get font28Bold => TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );
  static TextStyle get font48WhiteBold => TextStyle(
        fontSize: 48.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );
  static TextStyle get font16WhiteRegular => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      );
}
