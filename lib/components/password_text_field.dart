import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/input_decoration.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({super.key, required this.controller, required this.labelText, required this.hintText});

  final TextEditingController controller;
  final MyDecoration decor = MyDecoration();
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter a valid password';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        controller: controller,
        enableSuggestions: true,
        autocorrect: false,
        decoration: decor.getDecoration(
            icon: Icons.lock_outline_rounded,
            label: Text(labelText),
            hintText: hintText));
  }
}
