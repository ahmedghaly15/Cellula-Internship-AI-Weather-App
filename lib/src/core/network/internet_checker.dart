import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetChecker {
  final InternetConnectionChecker _connectionChecker;

  const InternetChecker(this._connectionChecker);

  Future<bool> get isConnected async => await _connectionChecker.hasConnection;
}
