import 'package:flutter/material.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_text_styles.dart';

class HaveAccountOrNotAction extends StatelessWidget {
  const HaveAccountOrNotAction({
    super.key,
    required this.question,
    required this.buttonText,
    required this.onPressed,
  });

  final String question, buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: AppTextStyles.font16WhiteRegular,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
