// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hamarasehyog/utils/colors.dart';

Future<void> showErrorDialog(BuildContext context, String text,
    {String title = "An Error Occurred"}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w800, color: AppColors.darkGrey)),
        content: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: AppColors.darkGrey,fontSize: 18)),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK')),
        ],
      );
    },
  );
}
