import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/router/routes.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/utils/app_assets.dart';
import 'package:internship_ai_weather_app/src/core/widgets/main_button.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              duration: const Duration(seconds: 2),
              child: SvgPicture.asset(
                Assets.svgsStartScreen,
              ),
            ),
            FadeInDown(
              duration: const Duration(seconds: 1),
              from: 50.h,
              child: MainButton(
                margin: EdgeInsets.only(top: 24.h, bottom: 12.h),
                onPressed: () {},
                text: "Sign up",
              ),
            ),
            FadeInUp(
              duration: const Duration(seconds: 1),
              from: 50.h,
              child: MainButton(
                onPressed: () =>
                    context.pushReplacementNamed(Routes.loginRoute),
                text: "Log in",
                backgroundColor: Colors.white,
                textColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
