import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/router/routes.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/cache_user.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/check_if_user_is_logged_in.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/circular_indicator_or_text_widget.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_toast.dart';
import 'package:internship_ai_weather_app/src/core/widgets/main_button.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/blocs/login_bloc.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/blocs/login_state.dart';

class LoginButtonBlocConsumer extends StatelessWidget {
  const LoginButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (_, current) =>
          current is LoginFailed || current is LoginSuccess,
      listener: (context, state) {
        state.whenOrNull(
          loginFailed: (error) => CustomToast.showToast(
            context: context,
            message: error,
            state: CustomToastState.error,
          ),
          loginSuccess: (appUser) async {
            currentUser = appUser;
            await cacheUserAndHisId(appUser);
            context.pushReplacementNamed(Routes.homeRoute);
          },
        );
      },
      buildWhen: (_, current) =>
          current is LoginLoading ||
          current is LoginFailed ||
          current is LoginSuccess,
      builder: (context, state) => MainButton(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        onPressed: () => context.read<LoginBloc>().login(context),
        child: circularIndicatorOrTextWidget(
          isLoading: state is LoginLoading,
          text: "LOGIN",
        ),
      ),
    );
  }
}
