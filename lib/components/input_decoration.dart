import 'package:flutter/material.dart';
import 'package:hamarasehyog/utils/colors.dart';

class MyDecoration {
  InputDecoration getDecoration(
      {required IconData icon,
      required Widget label,
      required String hintText}) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefixIcon: Icon(icon),
      label: label,
      helperText: "",
      errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
      helperStyle: const TextStyle(color: Colors.black, fontSize: 12),
      labelStyle: const TextStyle(color: AppColors.primaryBlack),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.darkGrey, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primaryBlack, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primaryBlack,width: 2),
      ),
    );
  }
}
