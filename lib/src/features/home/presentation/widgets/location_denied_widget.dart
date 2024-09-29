import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/core/utils/app_assets.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_toast.dart';
import 'package:internship_ai_weather_app/src/core/widgets/main_button.dart';
import 'package:internship_ai_weather_app/src/core/widgets/my_sized_box.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_bloc.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_event.dart';

class LocationDeniedWidget extends StatelessWidget {
  const LocationDeniedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: SvgPicture.asset(AppAssets.svgsEnableLocation),
        ),
        MySizedBox.height16,
        Text(
          'Enable your location',
          style: AppTextStyles.font28WhiteBold,
        ),
        MySizedBox.height16,
        Text(
          'To use this app, enable location in settings',
          style: AppTextStyles.font16WhiteRegular,
        ),
        MySizedBox.height24,
        MainButton(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          onPressed: () =>
              context.read<HomeBloc>().add(EnableLocationPermissionEvent()),
          text: "Sure, I'd like that",
        ),
        MySizedBox.height8,
        MainButton(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          onPressed: () {
            CustomToast.showToast(
              context: context,
              message: 'Location permission denied',
              state: CustomToastState.error,
            );
          },
          text: 'Not now',
          isOutlined: true,
        ),
      ],
    );
  }
}
