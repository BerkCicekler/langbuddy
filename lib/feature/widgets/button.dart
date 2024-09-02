// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class CustomFormButton extends StatelessWidget {
  const CustomFormButton({
    required this.text,
    required this.onTap,
    this.size,
    super.key,
  });

  final String text;

  final Size? size;

  final dynamic Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        disabledBackgroundColor: Colors.black.withAlpha(150),
        fixedSize: size,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
    );
  }
}
