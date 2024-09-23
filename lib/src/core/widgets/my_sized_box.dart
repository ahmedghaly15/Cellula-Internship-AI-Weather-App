import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSizedBox extends StatelessWidget {
  final double? height, width;

  const CustomSizedBox({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h,
      width: width?.w,
    );
  }
}

class MySizedBox {
  static const CustomSizedBox height72 = CustomSizedBox(height: 72);
  static const CustomSizedBox height24 = CustomSizedBox(height: 24);
  static const CustomSizedBox height8 = CustomSizedBox(height: 8);
  static const CustomSizedBox width12 = CustomSizedBox(width: 12);
}
