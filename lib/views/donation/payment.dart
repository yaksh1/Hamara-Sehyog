import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hamarasehyog/utils/dimensions.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final double height10 = Dimensions.height10;

  // var googlePayButton =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/qr.png',
                  height: height10*75,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
