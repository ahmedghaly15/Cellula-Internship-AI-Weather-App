import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_ai_weather_app/src/core/helpers/auth_validator.dart';
import 'package:internship_ai_weather_app/src/core/themes/app_colors.dart';
import 'package:internship_ai_weather_app/src/core/widgets/custom_text_field.dart';
import 'package:internship_ai_weather_app/src/core/widgets/my_sized_box.dart';
import 'package:internship_ai_weather_app/src/core/widgets/text_field_label.dart';
import 'package:internship_ai_weather_app/src/features/register/presentation/bloc/register_bloc.dart';
import 'package:internship_ai_weather_app/src/features/register/presentation/bloc/register_event.dart';
import 'package:internship_ai_weather_app/src/features/register/presentation/bloc/register_state.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterBloc>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldLabel(label: 'FULL NAME'),
          CustomTextField(
            validate: (String? value) {
              return AuthValidator.validateNameField(value);
            },
            controller: context.read<RegisterBloc>().nameController,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            autofillHints: const <String>[AutofillHints.name],
          ),
          MySizedBox.height8,
          const TextFieldLabel(label: 'EMAIL'),
          CustomTextField(
            validate: (String? value) {
              return AuthValidator.validateEmailField(value);
            },
            controller: context.read<RegisterBloc>().emailController,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const <String>[AutofillHints.email],
          ),
          MySizedBox.height8,
          const TextFieldLabel(label: 'PASSWORD'),
          BlocBuilder<RegisterBloc, RegisterState>(
            buildWhen: (_, current) => current is TogglePassVisibility,
            builder: (context, _) => CustomTextField(
              obscureText: context.read<RegisterBloc>().isPassVisible,
              suffixIcon: IconButton(
                onPressed: () => context
                    .read<RegisterBloc>()
                    .add(TogglePassVisibilityEvent()),
                icon: Icon(
                  context.read<RegisterBloc>().isPassVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              validate: (value) {
                return AuthValidator.validatePasswordField(value);
              },
              controller: context.read<RegisterBloc>().passwordController,
              keyboardType: TextInputType.visiblePassword,
              autofillHints: const <String>[AutofillHints.password],
            ),
          ),
          MySizedBox.height8,
          const TextFieldLabel(label: 'CONFIRM PASSWORD'),
          BlocBuilder<RegisterBloc, RegisterState>(
            buildWhen: (_, current) => current is ToggleConfirmPassVisibility,
            builder: (context, _) => CustomTextField(
              obscureText: context.read<RegisterBloc>().isConfirmPassVisible,
              suffixIcon: IconButton(
                onPressed: () => context
                    .read<RegisterBloc>()
                    .add(ToggleConfirmPassVisibilityEvent()),
                icon: Icon(
                  context.read<RegisterBloc>().isConfirmPassVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              onSubmit: (_) => context.read<RegisterBloc>().register(context),
              validate: (value) => AuthValidator.validateConfirmPasswordField(
                value: value,
                password: context.read<RegisterBloc>().passwordController.text,
                confirmPassword:
                    context.read<RegisterBloc>().confirmPassController.text,
              ),
              controller: context.read<RegisterBloc>().confirmPassController,
              keyboardType: TextInputType.visiblePassword,
              autofillHints: const <String>[AutofillHints.password],
            ),
          ),
        ],
      ),
    );
  }
}
