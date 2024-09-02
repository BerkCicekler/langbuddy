part of 'profile_page.dart';

mixin ProfilePageMixin on State<ProfilePage> {
  ///App's authService from GetIt
  late final AuthManager authService;

  @override
  void initState() {
    super.initState();
    authService = GetIt.I<AuthManager>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void logoutIconButton() {
    authService.logout();
  }

  void settingsIconButton() {}

  void nativeLanguageOnTap() {
    AutoRouter.of(context).push(LanguagePickerRoute(isSelectingNative: true));
  }

  void learningLanguageOnTap() {
    AutoRouter.of(context).push(LanguagePickerRoute(isSelectingNative: false));
  }
}
