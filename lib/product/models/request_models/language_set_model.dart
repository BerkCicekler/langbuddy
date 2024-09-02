import 'package:json_annotation/json_annotation.dart';
import 'package:langbuddy/product/models/user.dart';

part 'language_set_model.g.dart';

@JsonSerializable()
final class LanguageSetModel {
  LanguageSetModel({required this.native, required this.learning});

  /// User's native language
  final String native;

  /// The language user's want to practice
  final String learning;

  Map<String, dynamic> toJson() => _$LanguageSetModelToJson(this);

  factory LanguageSetModel.fromUser(User user) => LanguageSetModel(
        native: user.nativeLanguage,
        learning: user.learningLanguage,
      );

  LanguageSetModel copyWith({
    String? native,
    String? learning,
  }) {
    return LanguageSetModel(
      native: native ?? this.native,
      learning: learning ?? this.learning,
    );
  }
}
