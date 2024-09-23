import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_ai_weather_app/src/core/helpers/extensions.dart';
import 'package:internship_ai_weather_app/src/core/models/app_user.dart';
import 'package:internship_ai_weather_app/src/core/models/auth_action_params.dart';
import 'package:internship_ai_weather_app/src/core/utils/functions/cache_user.dart';
import 'package:internship_ai_weather_app/src/features/register/data/repositories/register_repo.dart';
import 'package:internship_ai_weather_app/src/features/register/presentation/bloc/register_event.dart';
import 'package:internship_ai_weather_app/src/features/register/presentation/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterBloc(this._registerRepo) : super(const RegisterState.initial()) {
    on<Register>(_register);
    on<TogglePassVisibilityEvent>(_togglePassVisibility);
    on<ToggleConfirmPassVisibilityEvent>(_toggleConfirmPassVisibility);
    _initFormAttributes();
  }

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController nameController;
  late final GlobalKey<FormState> formKey;

  void _initFormAttributes() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void register(BuildContext context) {
    if (formKey.currentState!.validate()) {
      add(Register());
      context.unfocusKeyboard();
    }
  }

  void _register(
    RegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterState.registerLoading());
    final AuthActionParams params = AuthActionParams(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    final result = await _registerRepo.register(params);
    result.when(
      success: (credential) async {
        await _saveUserDataInFirebaseAndCacheIt(credential.user!.uid, emit);
        emit(RegisterState.registerSuccess(credential.user!.uid));
      },
      failure: (failure) => emit(RegisterState.registerFailed(failure.error)),
    );
  }

  Future<void> _saveUserDataInFirebaseAndCacheIt(
    String userId,
    Emitter<RegisterState<dynamic>> emit,
  ) async {
    final AppUser appUser = AppUser(
      userId: userId,
      name: nameController.text.trim(),
      email: emailController.text.trim(),
    );
    await _saveUserInFirebaseDatabase(appUser, emit);
    await cacheUserAndHisId(appUser);
  }

  Future<void> _saveUserInFirebaseDatabase(
    AppUser appUser,
    Emitter<RegisterState> emit,
  ) async {
    final result = await _registerRepo.saveUserInFirebaseDatabase(appUser);
    result.when(
      success: (_) => emit(const RegisterState.saveUserInFirebaseDatabase()),
      failure: (failure) => emit(RegisterState.registerFailed(failure.error)),
    );
  }

  bool isPassVisible = true;
  void _togglePassVisibility(
    RegisterEvent event,
    Emitter<RegisterState> emit,
  ) {
    isPassVisible = !isPassVisible;
    emit(RegisterState.togglePassVisibility(isPassVisible));
  }

  bool isConfirmPassVisible = true;
  void _toggleConfirmPassVisibility(
    RegisterEvent event,
    Emitter<RegisterState> emit,
  ) {
    isConfirmPassVisible = !isConfirmPassVisible;
    emit(RegisterState.toggleConfirmPassVisibility(isConfirmPassVisible));
  }

  void _disposeFormAttributes() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Future<void> close() {
    _disposeFormAttributes();
    return super.close();
  }
}
