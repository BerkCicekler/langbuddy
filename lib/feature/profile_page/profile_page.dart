import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/product/constants/enums/padding_enums.dart';
import 'package:langbuddy/product/extension/asset_extensions.dart';
import 'package:langbuddy/product/manager/auth_manager.dart';
import 'package:langbuddy/product/navigation/app_router.dart';

part 'profile_page_mixin.dart';
part 'widgets/top_bar.dart';
part 'widgets/avatar_name.dart';
part 'widgets/languages.dart';

@RoutePage()
final class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProfilePageMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(PaddingConstants.page.value),
        child: Column(
          children: [
            _TopBar(
              settingsIconButton: settingsIconButton,
              logoutIconButton: logoutIconButton,
            ),
            _AvatarAndName(name: authService.user.userName),
            ListenableBuilder(
              listenable: authService,
              builder: (context, widget) {
                return _Languages(
                  nativeLanguageIso: authService.user.nativeLanguage,
                  nativeLanguageOnTap: nativeLanguageOnTap,
                  learningLanguageIso: authService.user.learningLanguage,
                  learningLanguageOnTap: learningLanguageOnTap,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
