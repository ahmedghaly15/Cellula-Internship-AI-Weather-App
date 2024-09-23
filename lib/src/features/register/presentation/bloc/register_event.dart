abstract class RegisterEvent {}

final class Register extends RegisterEvent {}

final class TogglePassVisibilityEvent extends RegisterEvent {}

final class ToggleConfirmPassVisibilityEvent extends RegisterEvent {}

final class SaveUserInFirebaseDatabaseEvent extends RegisterEvent {
  final String userId;

  SaveUserInFirebaseDatabaseEvent({required this.userId});
}
