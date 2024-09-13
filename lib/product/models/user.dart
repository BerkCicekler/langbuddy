import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String userName,
    required String email,
    required String nativeLanguage,
    required String learningLanguage,
  }) = _User;

  factory User.empty() => const User(
        id: -1,
        userName: '',
        email: '',
        nativeLanguage: '',
        learningLanguage: '',
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
