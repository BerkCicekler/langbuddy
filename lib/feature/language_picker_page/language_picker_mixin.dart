part of 'language_picker_page.dart';

mixin _LanguagePickerMixin on State<LanguagePickerPage> {
  late final List<Language> _languages;
  late final LanguagePickerCubit _languagePickerCubit;
  late final user = GetIt.I<AuthManager>().user;

  @override
  void initState() {
    super.initState();
    _languages = Language.languages;
    _languagePickerCubit = LanguagePickerCubit(
      languages: _languages,
      // language name is not important in this scenario
      initialLanguageValue: Language(
        isoCode: widget.isSelectingNative
            ? user.nativeLanguage
            : user.learningLanguage,
        name: '',
      ),
      isSelectingNative: widget.isSelectingNative,
    );
  }
}
