import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/circular_indicator_or_text_widget.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_toast.dart';
import 'package:internship_ai_weather_app/src/core/widgets/main_button.dart';
import 'package:internship_ai_weather_app/src/features/forecast/data/models/fetch_forecast_response.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_event.dart';
import 'package:internship_ai_weather_app/src/features/forecast/presentation/bloc/forecast_state.dart';

class PlayTennisPredictionBlocConsumer extends StatelessWidget {
  const PlayTennisPredictionBlocConsumer({
    super.key,
    required this.current,
  });

  final Current current;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForecastBloc, ForecastState>(
      listenWhen: (_, current) =>
          current is TennisPlayPredictionError ||
          current is TennisPlayPredictionSuccess,
      listener: (context, state) => state.whenOrNull(
        tennisPlayPredictionError: (error) => CustomToast.showToast(
          context: context,
          message: error,
          state: CustomToastState.error,
        ),
        tennisPlayPredictionSuccess: (tennisPlayPredictionResponse) async {
          final text = tennisPlayPredictionResponse.prediction[0] == 1
              ? 'Yes, you can play.'
              : 'Unfortunately, you can not play.';

          return await showAdaptiveDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel: '',
            builder: (_) => AlertDialog.adaptive(
              backgroundColor: AppColors.primaryColor,
              icon: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 48.h,
              ),
              title: Text(
                'Tennis Play Prediction',
                style: AppTextStyles.font24WhiteBold,
              ),
              content: Text(
                text,
                style: AppTextStyles.font16WhiteRegular,
              ),
              actions: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: Text(
                    'Ok',
                    style: AppTextStyles.font16WhiteBold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      buildWhen: (_, current) =>
          current is TennisPlayPredictionLoading ||
          current is TennisPlayPredictionError ||
          current is TennisPlayPredictionSuccess,
      builder: (context, state) => MainButton(
        margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        child: circularIndicatorOrTextWidget(
          isLoading: state is TennisPlayPredictionLoading,
          text: 'Can I Play Tennis Now?',
        ),
        onPressed: () =>
            context.read<ForecastBloc>().add(TennisPlayPrediction(current)),
      ),
    );
  }
}
