import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/feature/chat_page/chat_page.dart';
import 'package:langbuddy/feature/dashboard_page/dashboard_page.dart';
import 'package:langbuddy/feature/contacts_page/contacts_page.dart';
import 'package:langbuddy/feature/language_picker_page/language_picker_page.dart';
import 'package:langbuddy/feature/login_page/login_page.dart';
import 'package:langbuddy/feature/motification_page/notification_page.dart';
import 'package:langbuddy/feature/profile_page/profile_page.dart';
import 'package:langbuddy/feature/search_page/search_page.dart';
import 'package:langbuddy/feature/sign_up_page/sign_up_page.dart';
import 'package:langbuddy/product/manager/auth_manager.dart';
import 'package:langbuddy/product/models/friend.dart';
part 'app_router.gr.dart';
part 'auth_guard.dart';
part 'language_guard.dart';

/// App's Navigation class
/// all the routes defined here
@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(
          page: SignUpRoute.page,
          keepHistory: false,
        ),
        AutoRoute(
          page: DashBoardRoute.page,
          children: [
            AutoRoute(
              page: ContactsRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: SearchRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(page: LanguagePickerRoute.page),
        AutoRoute(page: NotificationRoute.page, keepHistory: false),
        AutoRoute(page: ChatRoute.page, keepHistory: false),
      ];

  @override
  late final List<AutoRouteGuard> guards = [
    AuthGuard(),
    LanguageGuard(),
  ];
}
