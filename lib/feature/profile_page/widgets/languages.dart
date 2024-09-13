part of '../profile_page.dart';

final class _Languages extends StatelessWidget {
  const _Languages({
    required this.nativeLanguageIso,
    required this.nativeLanguageOnTap,
    required this.learningLanguageIso,
    required this.learningLanguageOnTap,
  });

  final String nativeLanguageIso;
  final void Function() nativeLanguageOnTap;

  final String learningLanguageIso;
  final void Function() learningLanguageOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _LanguageShowWidget(
          label: 'I Speak',
          languageIsoCode: nativeLanguageIso,
          onFlagTap: nativeLanguageOnTap,
        ),
        _LanguageShowWidget(
          label: 'I Learn',
          languageIsoCode: learningLanguageIso,
          onFlagTap: learningLanguageOnTap,
        ),
      ],
    );
  }
}

final class _LanguageShowWidget extends StatelessWidget {
  const _LanguageShowWidget({
    required this.label,
    required this.languageIsoCode,
    required this.onFlagTap,
  });

  final String languageIsoCode;
  final String label;
  final void Function() onFlagTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: onFlagTap,
          child: SizedBox(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: SvgPicture.asset(
                languageIsoCode.languageToFlagSvg,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
