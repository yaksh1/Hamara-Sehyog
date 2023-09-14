import 'package:flutter/material.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';

class TextForm extends StatelessWidget {
  TextForm({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
  });

  final Widget? label;
  final String hintText;
  final IconData icon;
  double height10 = Dimensions.height10;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        label: label,
        labelStyle: TextStyle(color: AppColors.primaryBlack),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(height10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryBlack, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }
}
