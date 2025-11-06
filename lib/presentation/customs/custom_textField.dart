import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool obscureText;

  const CustomTextField({
    required this.labelText,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
      child: TextFormField(
        style: const TextStyle(color: Colors.white, fontSize: 16),
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          labelText: labelText,
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
