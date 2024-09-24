import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_ai_weather_app/src/core/models/app_user.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loginLoading() = LoginLoading;
  const factory LoginState.loginSuccess(AppUser appUser) = LoginSuccess<T>;
  const factory LoginState.loginFailed(String error) = LoginFailed<T>;
  const factory LoginState.togglePasswordVisibility(
    bool isLoginPassVisible,
  ) = TogglePasswordVisibility;
}
