import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.validateMsg,
    required this.hintText,
    this.eyeIcon,
    required this.keyboardType,
  });
  final TextEditingController controller;
  final obscureText;
  final String validateMsg;
  final String hintText;
  final Widget? eyeIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black,
      elevation: 20,
      animationDuration: const Duration(milliseconds: 200),
      borderRadius: BorderRadius.circular(8.0),
      child: CupertinoTextField(
        controller: controller,
        suffix: eyeIcon,
        placeholder: hintText,
        obscureText: obscureText,
        keyboardType: keyboardType,
        padding: const EdgeInsets.all(12.0),
        onEditingComplete: () {
          print("submitttee");
        },
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border.all(
            color: CupertinoColors.lightBackgroundGray,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}




class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.controller,
  });
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: hintText,

      padding: const EdgeInsets.all(12.0),
      onChanged: onChanged,
      controller: controller,
      prefix: GestureDetector(
          onTap: (){},
          child: const Padding(
        padding: EdgeInsets.only(left:8.0),
        child: Icon(CupertinoIcons.search,color: Colors.black,),
      )),
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        border: Border.all(
          color: CupertinoColors.lightBackgroundGray,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}