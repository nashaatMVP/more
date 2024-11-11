import 'package:flutter/material.dart';
import 'package:more/constants/custom_text.dart';

/// SUCCESS
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> successMsg(context, String eMsg) => ScaffoldMessenger.of(context).
showSnackBar(
    snackBarAnimationStyle: AnimationStyle(
      curve: Curves.fastEaseInToSlowEaseOut,
    ),
    SnackBar(
      content: TextWidgets.subHeading(eMsg,color: Colors.white,fontSize: 16),
      elevation: 30,
      backgroundColor: Colors.green.shade500,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      duration: const Duration(milliseconds: 500),
      behavior: SnackBarBehavior.floating,
    ));

/// Error
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> errorMsg(context,String sMsg) => ScaffoldMessenger.of(context).
showSnackBar(
    SnackBar(
      content: TextWidgets.subHeading(sMsg,color: Colors.white,fontSize: 15),
      elevation: 30,
      backgroundColor: Colors.red.shade500,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      duration: const Duration(milliseconds: 500),
      behavior: SnackBarBehavior.floating,
    ));