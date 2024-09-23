import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@Freezed(toJson: true, fromJson: true)
class AppUser with _$AppUser {
  const factory AppUser({
    required String userId,
    required String email,
    required String name,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
