part of 'app_router.dart';

final class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authService = GetIt.I<AuthManager>();
    if (resolver.isReevaluating) {
      print("ohaaa");
      if (authService.isAuthenticated) {
        resolver.next();
        if (!router.isRouteActive(DashBoardRoute.name)) {
          resolver.redirect(DashBoardRoute());
        }
      } else {
        resolver.next(false);
        resolver.redirect(LoginRoute());
      }
    } else {
      if (authService.isAuthenticated) {
        if (resolver.routeName == LoginRoute.name ||
            resolver.routeName == SignUpRoute.name) {
          resolver.next(false);
          resolver.redirect(DashBoardRoute());
          return;
        }
        resolver.next();
      } else if (resolver.routeName == LoginRoute.name ||
          resolver.routeName == SignUpRoute.name) {
        resolver.next();
      } else {
        resolver.next(false);
        resolver.redirect(LoginRoute());
      }
    }
  }
}
