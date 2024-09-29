import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/core/utils/app_assets.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_circular_progress_indicator.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_bloc.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_state.dart';
import 'package:latlong2/latlong.dart';

class CustomMapBlocBuilder extends StatelessWidget {
  const CustomMapBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (_, current) =>
          current is FetchCityDataSuccess ||
          current is FetchCityDataError ||
          current is FetchCityDataLoading,
      builder: (_, state) {
        if (state is FetchCityDataSuccess) {
          return _mapWidget(context, state);
        } else if (state is FetchCityDataError) {
          return _errorWidget(state);
        } else {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _mapWidget(
    BuildContext context,
    FetchCityDataSuccess<dynamic> state,
  ) {
    return Container(
      height: context.height * 0.65,
      margin: EdgeInsets.all(24.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(
              double.parse(state.cityDataEntity.lat),
              double.parse(state.cityDataEntity.lon),
            ),
            initialZoom: 13,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(
                    double.parse(state.cityDataEntity.lat),
                    double.parse(state.cityDataEntity.lon),
                  ),
                  width: 80,
                  height: 80,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _errorWidget(FetchCityDataError<dynamic> state) {
  return Container(
    margin: EdgeInsets.all(24.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AppAssets.svgsEnableLocation),
        Text(
          state.error,
          style: AppTextStyles.font16WhiteBold,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
