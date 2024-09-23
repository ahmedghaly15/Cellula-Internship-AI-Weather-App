import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/router/routes.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/circular_indicator_or_text_widget.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_toast.dart';
import 'package:internship_ai_weather_app/src/core/widgets/main_button.dart';
import 'package:internship_ai_weather_app/src/features/register/presentation/bloc/register_bloc.dart';
import 'package:internship_ai_weather_app/src/features/register/presentation/bloc/register_state.dart';

class RegisterButtonBlocConsumer extends StatelessWidget {
  const RegisterButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listenWhen: (_, current) =>
          current is RegisterFailed || current is RegisterSuccess,
      listener: (context, state) {
        state.whenOrNull(
          registerFailed: (error) => CustomToast.showToast(
            context: context,
            message: error,
            state: CustomToastState.error,
          ),
          registerSuccess: (_) =>
              context.pushReplacementNamed(Routes.homeRoute),
        );
      },
      buildWhen: (_, current) =>
          current is RegisterLoading ||
          current is RegisterSuccess ||
          current is RegisterFailed,
      builder: (context, state) => MainButton(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        onPressed: () => context.read<RegisterBloc>().register(context),
        child: circularIndicatorOrTextWidget(
          isLoading: state is RegisterLoading,
          text: "SIGN UP",
        ),
      ),
    );
  }
}
