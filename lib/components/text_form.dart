import 'package:flutter/material.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';

class TextForm extends StatelessWidget {
  TextForm(
      {super.key,
      required this.label,
      required this.hintText,
      required this.icon,
      this.controller, });

  final Widget? label;
  final String hintText;
  final IconData icon;
  double height10 = Dimensions.height10;
  TextEditingController? controller;
 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: _buildInputDecoration(),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefixIcon: Icon(icon),
      label: label,
      errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
      helperStyle: const TextStyle(color: Colors.black, fontSize: 12),
      labelStyle: const TextStyle(color: AppColors.primaryBlack),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(height10),
      ),
      enabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide:const BorderSide(color: AppColors.darkGrey, width: 1),
      ),
      focusedBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),

        borderSide:const BorderSide(color: AppColors.primaryBlack, width: 2),
      ),
      errorBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),

        borderSide:const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),

        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    );
  }
}
