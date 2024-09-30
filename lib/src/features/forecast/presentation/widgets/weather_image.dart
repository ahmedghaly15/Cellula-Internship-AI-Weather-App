import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_cached_network_image.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
      imageUrl: 'https:$imageUrl',
      imageBuilder: (context, image) => Container(
        height: context.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          image: DecorationImage(
            image: image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
