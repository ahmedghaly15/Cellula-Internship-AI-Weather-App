import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_cached_network_image.dart';
import 'package:internship_ai_weather_app/src/core/widgets/my_sized_box.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/city_and_country_and_refresh_button.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/days_list_view_bloc_builder.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/widgets/labeled_circular_percent_indicator.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CityAndCountryAndRefreshButton(),
            ),
            const SliverToBoxAdapter(
              child: DaysListViewBlocBuilder(),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Sunny',
                style: AppTextStyles.font24WhiteBold,
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabeledCircularPercentIndicator(),
                        LabeledCircularPercentIndicator(),
                      ],
                    ),
                    MySizedBox.height24,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabeledCircularPercentIndicator(),
                        LabeledCircularPercentIndicator(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CustomCachedNetworkImage(
                imageUrl:
                    'https://img.freepik.com/free-vector/realistic-weather-widget_1284-4092.jpg?t=st=1727613783~exp=1727617383~hmac=61521f5a2099f882212c9d82ec6dbf30706486b32f300c37c2de6f94d715bde2&w=740',
                imageBuilder: (_, image) => Container(
                  height: 150.h,
                  width: 150.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
