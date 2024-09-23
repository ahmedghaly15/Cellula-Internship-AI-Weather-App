import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState<T> with _$RegisterState<T> {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.registerLoading() = RegisterLoading;
  const factory RegisterState.registerSuccess(String userId) =
      RegisterSuccess<T>;
  const factory RegisterState.registerFailed(String error) = RegisterFailed<T>;
  const factory RegisterState.togglePassVisibility(
    bool isPassVisible,
  ) = TogglePassVisibility;
  const factory RegisterState.toggleConfirmPassVisibility(
    bool isConfirmPassVisible,
  ) = ToggleConfirmPassVisibility;
}
