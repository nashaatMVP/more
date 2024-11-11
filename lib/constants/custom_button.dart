import 'package:flutter/material.dart';
import 'package:more/constants/constants.dart';
import 'package:more/constants/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    required this.textColor,
    required this.buttonColor,
    this.borderColor,
  });
  final Function()? onTap;
  final String text;
  final Color textColor;
  final Color buttonColor;
  final Color? borderColor;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        shadowColor: Colors.black,
        elevation: 15,
        animationDuration: const Duration(milliseconds: 200),
        borderRadius: BorderRadius.circular(8.0),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: borderColor!,
                width: 2,
              ),
            ),
          child: Center(child: TextWidgets.bodyText(text,color: textColor,fontSize: 18)),
        ),
      ),
    );
  }
}
