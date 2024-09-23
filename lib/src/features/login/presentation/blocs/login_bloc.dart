import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/models/auth_action_params.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/cache_user.dart';
import 'package:internship_ai_weather_app/src/features/login/data/repositories/login_repo.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/blocs/login_event.dart';
import 'package:internship_ai_weather_app/src/features/login/presentation/blocs/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo _loginRepo;

  LoginBloc(this._loginRepo) : super(const LoginState.initial()) {
    on<Login>(_login);
    on<TogglePasswordVisibilityEvent>(_togglePassVisibility);
    _initFormAttributes();
  }

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;
  late final GlobalKey<FormState> formKey;

  void _initFormAttributes() {
    _initControllers();
    _initFocusNodes();
    formKey = GlobalKey<FormState>();
  }

  void _initFocusNodes() {
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  void _initControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void _login(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.loginLoading());
    final AuthActionParams params = AuthActionParams(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    final result = await _loginRepo.login(params);
    result.when(
      success: (appUser) async {
        await cacheUserAndHisId(appUser);
        emit(LoginState.loginSuccess(appUser.userId));
      },
      failure: (failure) => emit(LoginState.loginFailed(failure.error)),
    );
  }

  void login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      add(Login());
      context.unfocusKeyboard();
    }
  }

  bool isPassObscured = true;
  void _togglePassVisibility(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) {
    isPassObscured = !isPassObscured;
    emit(LoginState.togglePasswordVisibility(isPassObscured));
  }

  void _disposeFormAttributes() {
    _disposeController();
    _disposeFocusNodes();
  }

  void _disposeFocusNodes() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  void _disposeController() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Future<void> close() {
    _disposeFormAttributes();
    return super.close();
  }
}
