import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/router/routes.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/city_and_country.dart';

class CityAndCountryAndCurrentButton extends StatelessWidget {
  const CityAndCountryAndCurrentButton({
    super.key,
    required this.current,
    required this.city,
    required this.country,
  });

  final Current current;
  final String city, country;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.h, left: 24.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CityAndCountry(
            city: city,
            country: country,
          ),
          TextButton.icon(
            onPressed: () => context.pushNamed(
              Routes.currentCityWeather,
              arguments: current,
            ),
            icon: Icon(
              Icons.cloud,
              color: Colors.white,
              size: 32.h,
            ),
            label: Text(
              'Current',
              style: AppTextStyles.font16WhiteBold,
            ),
          ),
        ],
      ),
    );
  }
}
