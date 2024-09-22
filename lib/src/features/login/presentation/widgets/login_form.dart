import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_text_field.dart';
import 'package:internship_ai_weather_app/src/core/widgets/my_sized_box.dart';
import 'package:internship_ai_weather_app/src/core/widgets/text_field_label.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldLabel(label: "Email"),
          CustomTextField(),
          MySizedBox.height8,
          TextFieldLabel(label: "Password"),
          CustomTextField(),
        ],
      ),
    );
  }
}
