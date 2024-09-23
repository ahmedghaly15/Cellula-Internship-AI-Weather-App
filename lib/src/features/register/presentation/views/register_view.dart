import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/widgets/auth_view_description.dart';
import 'package:internship_ai_weather_app/src/core/widgets/auth_view_label.dart';
import 'package:internship_ai_weather_app/src/core/widgets/have_account_or_not_action.dart';
import 'package:internship_ai_weather_app/src/core/widgets/main_button.dart';
import 'package:internship_ai_weather_app/src/core/widgets/my_sized_box.dart';
import 'package:internship_ai_weather_app/src/features/register/presentation/widgets/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AuthViewLabel(label: 'SIGN UP'),
                  const AuthViewDescription(description: 'CREATE AN ACCOUNT'),
                  MySizedBox.height24,
                  const RegisterForm(),
                  MySizedBox.height24,
                  MainButton(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    onPressed: () {},
                    text: "SIGN UP",
                  ),
                  HaveAccountOrNotAction(
                    question: 'Have an account?',
                    buttonText: 'Login',
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
