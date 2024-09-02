// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    this.validator,
    this.hint,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.maxWidth,
    this.maxHeight = 60,
    super.key,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;

  final String? hint;
  final String? labelText;

  final TextInputType keyboardType;

  final double? maxWidth;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxHeight,
      width: maxWidth ?? MediaQuery.of(context).size.width * .85,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 2),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Color(0XFFe5e5e5), width: 2),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide:
                BorderSide(color: Color.fromARGB(255, 220, 21, 21), width: 2),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Color(0XFFe5e5e5), width: 2),
          ),
          errorStyle: TextStyle(height: .1, fontSize: 13),
          errorMaxLines: 2,
          hintText: hint,
          labelText: labelText,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
