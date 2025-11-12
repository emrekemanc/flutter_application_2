import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomFormBuilderTextfield extends StatelessWidget {
  final String title;
  final String? Function(String?)? validator;
  final bool scretText;
  final String? errorText;

  const CustomFormBuilderTextfield({
    required this.title,
    this.validator,
    this.scretText = false,
    this.errorText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
      child: FormBuilderTextField(
        name: title,
        validator: validator,
        obscureText: scretText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          labelText: title,
          errorText: errorText,
          labelStyle: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 16,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 0, 0, 0),
              width: 0.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 2.5),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 20.0,
          ),
        ),
      ),
    );
  }
}
