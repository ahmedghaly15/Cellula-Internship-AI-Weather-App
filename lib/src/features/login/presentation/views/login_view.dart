import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/core/widgets/auth_view_description.dart';
import 'package:internship_ai_weather_app/src/core/widgets/auth_view_label.dart';
import 'package:internship_ai_weather_app/src/core/widgets/have_account_or_not_action.dart';
import 'package:internship_ai_weather_app/src/core/widgets/my_sized_box.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/widgets/forgot_password_text_button.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/widgets/login_button_bloc_consumer.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  const AuthViewLabel(label: "LOGIN"),
                  const AuthViewDescription(
                    description: 'LOGIN TO YOUR ACCOUNT',
                  ),
                  MySizedBox.height72,
                  const LoginForm(),
                  const ForgotPasswordTextButton(),
                  MySizedBox.height24,
                  const LoginButtonBlocConsumer(),
                  HaveAccountOrNotAction(
                    onPressed: () {},
                    buttonText: 'Sign up',
                    question: "Don't have an account?",
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
