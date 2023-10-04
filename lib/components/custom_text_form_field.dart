import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final IconData? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField(
      {super.key,
      this.controller,
      required this.labelText,
      this.validator,
      this.focusNode,
      this.onChanged,
      this.keyboardType,
      this.textInputAction,
      this.prefixIcon,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      decoration:
          InputDecoration(labelText: labelText, prefixIcon: Icon(prefixIcon)),
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }
}
