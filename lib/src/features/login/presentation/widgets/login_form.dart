import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_ai_weather_app/src/core/helpers/auth_validator.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_text_field.dart';
import 'package:internship_ai_weather_app/src/core/widgets/my_sized_box.dart';
import 'package:internship_ai_weather_app/src/core/widgets/text_field_label.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/blocs/login_bloc.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/blocs/login_event.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/blocs/login_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginBloc>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldLabel(label: "Email"),
          CustomTextField(
            controller: context.read<LoginBloc>().emailController,
            focusNode: context.read<LoginBloc>().emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            validate: (String? value) =>
                AuthValidator.validateEmailField(value),
            onEditingComplete: () {
              context.requestFocus(
                context.read<LoginBloc>().passwordFocusNode,
              );
            },
          ),
          MySizedBox.height8,
          const TextFieldLabel(label: "Password"),
          BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (_, current) => current is TogglePasswordVisibility,
            builder: (context, _) => CustomTextField(
              autofillHints: const <String>[AutofillHints.password],
              validate: (String? value) =>
                  AuthValidator.validatePasswordField(value),
              focusNode: context.read<LoginBloc>().passwordFocusNode,
              onSubmit: (_) => context.read<LoginBloc>().login(context),
              controller: context.read<LoginBloc>().passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: context.read<LoginBloc>().isPassObscured,
              suffixIcon: IconButton(
                onPressed: () {
                  context
                      .read<LoginBloc>()
                      .add(TogglePasswordVisibilityEvent());
                },
                icon: Icon(
                  context.read<LoginBloc>().isPassObscured
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
