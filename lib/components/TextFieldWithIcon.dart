import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldWithIcon extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final String? label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<MaskTextInputFormatter>? inputFormatters;

  const TextFieldWithIcon(
      {super.key,
      this.controller,
      this.icon,
      this.label,
      this.obscureText = false,
      this.keyboardType,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
    );
  }
}
