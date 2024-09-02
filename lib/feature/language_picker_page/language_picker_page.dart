import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/feature/widgets/button.dart';
import 'package:langbuddy/product/bloc/language_picker_cubit/language_picker_cubit.dart';
import 'package:langbuddy/product/extension/asset_extensions.dart';
import 'package:langbuddy/product/manager/auth_manager.dart';
import 'package:langbuddy/product/models/language.dart';

part 'language_picker_mixin.dart';

@RoutePage()
final class LanguagePickerPage extends StatefulWidget {
  /// Warning: if [isSelectingNative] is true the cubit will update
  /// the user's native language value if its false user's learning language
  /// value will be updated
  const LanguagePickerPage({
    required this.isSelectingNative,
    this.canPop = true,
    super.key,
  });

  final bool isSelectingNative;
  final bool canPop;

  @override
  State<LanguagePickerPage> createState() => _LanguagePickerPageState();
}

class _LanguagePickerPageState extends State<LanguagePickerPage>
    with _LanguagePickerMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _languagePickerCubit,
      child: PopScope(
        canPop: widget.canPop,
        child: Scaffold(
          appBar: AppBar(
            leading: widget.canPop ? null : const SizedBox.shrink(),
            title: Text(widget.isSelectingNative ? 'I speak' : 'I learn'),
          ),
          body: const SafeArea(
            child: _LanguageList(),
          ),
        ),
      ),
    );
  }
}

class _LanguageList extends StatelessWidget {
  const _LanguageList();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final languagePickerCubit = context.watch<LanguagePickerCubit>();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: languagePickerCubit.languages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(languagePickerCubit.languages[index].name),
                leading: SvgPicture.asset(
                  width: 30,
                  languagePickerCubit
                      .languages[index].isoCode.languageToFlagSvg,
                ),
                trailing: Radio(
                  value: languagePickerCubit.languages[index],
                  groupValue: languagePickerCubit.state,
                  onChanged: languagePickerCubit.setLanguage,
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 90,
          child: Center(
            child: CustomFormButton(
              text: 'Continue',
              onTap: languagePickerCubit.isLanguageChangedAndNotNull
                  ? languagePickerCubit.continueButtonPressed
                  : null,
              size: Size(width * .9, 60),
            ),
          ),
        ),
      ],
    );
  }
}
