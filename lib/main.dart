import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/product/init/product_initialization.dart';
import 'package:langbuddy/product/manager/auth_manager.dart';
import 'package:langbuddy/product/navigation/app_router.dart';
import 'package:langbuddy/product/theme/light_theme.dart';

void main() async {
  await ProductInitialization.mainInit();
  runApp(const _MyApp());
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GetIt.instance<AppRouter>().config(
        reevaluateListenable: GetIt.I<AuthManager>(),
      ),
      title: 'Lang Buddy',
      theme: CustomLightTheme.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
