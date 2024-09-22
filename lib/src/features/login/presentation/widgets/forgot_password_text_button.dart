import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  const ForgotPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text('Forgot Password?'),
      ),
    );
  }
}
