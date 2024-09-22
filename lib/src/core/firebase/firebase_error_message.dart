class FirebaseErrorMessage {
  FirebaseErrorMessage._();

  static const String userNotFound = 'User not found';
  static const String wrongPassword = 'Wrong password';
  static const String weakPassword = 'Weak password';
  static const String emailAlreadyInUse = 'Email already in use';
  static const String invalidEmail = 'Invalid email';
  static const String defaultError = 'Opps, something went wrong!';
  static const String invalidCredential =
      'Incorrect login details. Please ensure your email and password are correct.';
  static const String requiresRecentLogin =
      'Requires recent login. Please log in again.';
  static const String networkRequestFailed =
      'A network request failed. Please check your internet connection and try again.';
  static const String userDisabled =
      'The user account has been disabled by an administrator.';
  static const String userTokenExpired =
      'Your credentials have expired. Please log in again.';
}
