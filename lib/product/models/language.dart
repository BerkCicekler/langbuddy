import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable()
class Language extends Equatable {
  Language({required this.isoCode, required this.name});

  final String isoCode;
  final String name;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  static List<Language> get languages => _languages;

  static List<Language> _languages =
      _map.map((jsonItem) => Language.fromJson(jsonItem)).toList();

  static final List<Map<String, String>> _map = [
    {'isoCode': 'ae', 'name': 'Arabic'},
    {'isoCode': 'am', 'name': 'Armenian'},
    {'isoCode': 'az', 'name': 'Azerbaijani'},
    {'isoCode': 'bg', 'name': 'Bulgarian'},
    {'isoCode': 'my', 'name': 'Burmese'},
    {'isoCode': 'cu', 'name': 'Church Slavonic'},
    {'isoCode': 'cv', 'name': 'Chuvash'},
    {'isoCode': 'kw', 'name': 'Cornish'},
    {'isoCode': 'co', 'name': 'Corsican'},
    {'isoCode': 'cr', 'name': 'Cree'},
    {'isoCode': 'hr', 'name': 'Croatian'},
    {'isoCode': 'cz', 'name': 'Czech'},
    {'isoCode': 'dk', 'name': 'Danish'},
    {'isoCode': 'nl', 'name': 'Dutch'},
    {'isoCode': 'dz', 'name': 'Dzongkha'},
    {'isoCode': 'gb', 'name': 'English'},
    {'isoCode': 'et', 'name': 'Estonian'},
    {'isoCode': 'ee', 'name': 'Ewe'},
    {'isoCode': 'fo', 'name': 'Faroese'},
    {'isoCode': 'fj', 'name': 'Fijian'},
    {'isoCode': 'fi', 'name': 'Finnish'},
    {'isoCode': 'fr', 'name': 'French'},
    {'isoCode': 'gd', 'name': 'Gaelic'},
    {'isoCode': 'gl', 'name': 'Galician'},
    {'isoCode': 'ge', 'name': 'Georgian'},
    {'isoCode': 'de', 'name': 'German'},
    {'isoCode': 'gr', 'name': 'Greek'},
    {'isoCode': 'gn', 'name': 'Guarani'},
    {'isoCode': 'gu', 'name': 'Gujarati'},
    {'isoCode': 'ht', 'name': 'Haitian'},
    {'isoCode': 'hu', 'name': 'Hungarian'},
    {'isoCode': 'is', 'name': 'Icelandic'},
    {'isoCode': 'io', 'name': 'Ido'},
    {'isoCode': 'id', 'name': 'Indonesian'},
    {'isoCode': 'it', 'name': 'Italian'},
    {'isoCode': 'jp', 'name': 'Japanese'},
    {'isoCode': 'kn', 'name': 'Kannada'},
    {'isoCode': 'ki', 'name': 'Kikuyu'},
    {'isoCode': 'rw', 'name': 'Kinyarwanda'},
    {'isoCode': 'ky', 'name': 'Kirghiz'},
    {'isoCode': 'kg', 'name': 'Kongo'},
    {'isoCode': 'kr', 'name': 'Korean'},
    {'isoCode': 'la', 'name': 'Latin'},
    {'isoCode': 'lv', 'name': 'Latvian'},
    {'isoCode': 'li', 'name': 'Limburgan'},
    {'isoCode': 'lt', 'name': 'Lithuanian'},
    {'isoCode': 'lu', 'name': 'Luba-Katanga'},
    {'isoCode': 'lb', 'name': 'Luxembourgish'},
    {'isoCode': 'mk', 'name': 'Macedonian'},
    {'isoCode': 'mg', 'name': 'Malagasy'},
    {'isoCode': 'ms', 'name': 'Malay'},
    {'isoCode': 'ml', 'name': 'Malayalam'},
    {'isoCode': 'mt', 'name': 'Maltese'},
    {'isoCode': 'mr', 'name': 'Marathi'},
    {'isoCode': 'mh', 'name': 'Marshallese'},
    {'isoCode': 'mn', 'name': 'Mongolian'},
    {'isoCode': 'na', 'name': 'Nauru'},
    {'isoCode': 'nr', 'name': 'Ndebele, South'},
    {'isoCode': 'ng', 'name': 'Ndonga'},
    {'isoCode': 'ne', 'name': 'Nepali'},
    {'isoCode': 'om', 'name': 'Oromo'},
    {'isoCode': 'pa', 'name': 'Panjabi'},
    {'isoCode': 'pl', 'name': 'Polish'},
    {'isoCode': 'pt', 'name': 'Portuguese'},
    {'isoCode': 'ps', 'name': 'Pushto'},
    {'isoCode': 'ro', 'name': 'Romanian'},
    {'isoCode': 'ru', 'name': 'Russian'},
    {'isoCode': 'sm', 'name': 'Samoan'},
    {'isoCode': 'sg', 'name': 'Sango'},
    {'isoCode': 'sa', 'name': 'Sanskrit'},
    {'isoCode': 'sc', 'name': 'Sardinian'},
    {'isoCode': 'sr', 'name': 'Serbian'},
    {'isoCode': 'sn', 'name': 'Shona'},
    {'isoCode': 'sd', 'name': 'Sindhi'},
    {'isoCode': 'si', 'name': 'Sinhala'},
    {'isoCode': 'sk', 'name': 'Slovak'},
    {'isoCode': 'sl', 'name': 'Slovenian'},
    {'isoCode': 'so', 'name': 'Somali'},
    {'isoCode': 'st', 'name': 'Sotho, Southern'},
    {'isoCode': 'es', 'name': 'Spanish'},
    {'isoCode': 'ss', 'name': 'Swati'},
    {'isoCode': 'sv', 'name': 'Swedish'},
    {'isoCode': 'tl', 'name': 'Tagalog'},
    {'isoCode': 'tg', 'name': 'Tajik'},
    {'isoCode': 'ta', 'name': 'Tamil'},
    {'isoCode': 'tt', 'name': 'Tatar'},
    {'isoCode': 'th', 'name': 'Thai'},
    {'isoCode': 'bo', 'name': 'Tibetan'},
    {'isoCode': 'to', 'name': 'Tonga (Tonga Islands)'},
    {'isoCode': 'tn', 'name': 'Tswana'},
    {'isoCode': 'tr', 'name': 'Turkish'},
    {'isoCode': 'tk', 'name': 'Turkmen'},
    {'isoCode': 'tw', 'name': 'Twi'},
    {'isoCode': 'ug', 'name': 'Uighur'},
    {'isoCode': 'ua', 'name': 'Ukrainian'},
    {'isoCode': 'uz', 'name': 'Uzbek'},
    {'isoCode': 've', 'name': 'Venda'},
    {'isoCode': 'vi', 'name': 'Vietnamese'},
    {'isoCode': 'cy', 'name': 'Welsh'},
    {'isoCode': 'za', 'name': 'Zhuang'}
  ];

  @override
  List<Object?> get props => [isoCode];
}
