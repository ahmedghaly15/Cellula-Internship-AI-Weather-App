import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/circular_indicator_or_text_widget.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_toast.dart';
import 'package:internship_ai_weather_app/src/core/widgets/main_button.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_bloc.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_event.dart';
import 'package:internship_ai_weather_app/src/features/home/presentation/blocs/home_state.dart';

class SearchButtonBlocConsumer extends StatelessWidget {
  const SearchButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (_, current) => current is FetchCurrentError,
      listener: (context, state) {
        state.whenOrNull(
          fetchCurrentError: (error) {
            CustomToast.showToast(
              context: context,
              message: error,
              state: CustomToastState.error,
            );
          },
        );
      },
      buildWhen: (_, current) =>
          current is FetchCurrentLoading ||
          current is FetchCurrentSuccess ||
          current is FetchCurrentError,
      builder: (context, state) => MainButton(
        margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        onPressed: () => context.read<HomeBloc>().add(FetchCurrentEvent()),
        child: circularIndicatorOrTextWidget(
          isLoading: state is FetchCurrentLoading,
          text: 'Search',
        ),
      ),
    );
  }
}
