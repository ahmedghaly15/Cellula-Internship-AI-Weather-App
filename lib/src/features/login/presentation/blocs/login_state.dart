import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loginLoading() = LoginLoading;
  const factory LoginState.loginSuccess(String userId) = LoginSuccess<T>;
  const factory LoginState.loginFailed(String error) = LoginFailed<T>;
  const factory LoginState.togglePasswordVisibility(
    bool isLoginPassVisible,
  ) = TogglePasswordVisibility;
}
