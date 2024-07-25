import 'package:chat_app/core/utils/fontStyle.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.emailController,
    this.labelText,
    this.validator,
    this.suffixIcon,
    this.unVisible = false,
  });
  final String? labelText;
  final String? Function(String? value)? validator;
  final bool unVisible;
  final Widget? suffixIcon;

  final TextEditingController? emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: unVisible,
      style: getWhiteFont(),
      cursorColor: Colors.blue,
      validator: validator,
      controller: emailController,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          errorStyle: getWhiteFont(color: Colors.red),
          contentPadding: const EdgeInsets.all(20),
          labelText: labelText,
          labelStyle: getWhiteFont(fontweight: FontWeight.w500),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2))),
    );
  }
}
