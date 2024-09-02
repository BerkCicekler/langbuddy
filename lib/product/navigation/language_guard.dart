part of 'app_router.dart';

/// This guard will protect the user from using the application
/// with selecting any native language or learning language data
final class LanguageGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authService = GetIt.I<AuthManager>();
    if (resolver.isReevaluating) {
      if (authService.isAuthenticated &&
          resolver.routeName == DashBoardRoute.name) {
        resolver.next();
        languageProtector(resolver, authService);
        return;
      }
      resolver.next();
      return;
    } else {
      if (authService.isAuthenticated &&
          resolver.routeName == DashBoardRoute.name) {
        resolver.next();
        languageProtector(resolver, authService);
      } else {
        resolver.next();
      }
    }
  }

  void languageProtector(NavigationResolver resolver, AuthManager authService) {
    if (authService.user.nativeLanguage.isEmpty) {
      resolver.redirect(
        LanguagePickerRoute(
          isSelectingNative: true,
          canPop: false,
        ),
      );
    }
    if (authService.user.learningLanguage.isEmpty) {
      resolver.redirect(LanguagePickerRoute(
        isSelectingNative: false,
        canPop: false,
      ));
    }
  }
}
