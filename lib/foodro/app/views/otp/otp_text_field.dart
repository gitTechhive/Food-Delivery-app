import 'package:flutter/material.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:get/get.dart';

class OtpTextField extends StatelessWidget {
  final FocusNode focusNode;
  final Function(String) onTextChanged;

  final ThemeData theme;
  const OtpTextField({
    super.key,
    required this.focusNode,
    required this.onTextChanged, required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Get.isDarkMode ? foodCardDark : colorGrey50,
        shape: BoxShape.rectangle,
        border: Border.all(
            width: 1, color: Get.isDarkMode ? foodBorderDark : foodBorderColor),
      ),
      child: TextField(
        style: theme
            .textTheme
            .headlineSmall
            ?.copyWith(fontWeight: FontWeight.bold),
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration:const InputDecoration(
            counter:  Offstage(),
            border: InputBorder.none,),
        onChanged: onTextChanged,
      ),
    );
  }
}
