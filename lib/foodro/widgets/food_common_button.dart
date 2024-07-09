import 'package:flutter/material.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/food_theme/food_theme.dart';

class FoodCommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? bgColor;
  final Color? borderColor;
  final Color? textColor;
  final BoxBorder? boxBorder;
  final TextStyle? textStyle;


  const FoodCommonButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.width,
      this.height,
      this.fontSize,
      this.bgColor,
      this.textColor,
      this.borderColor,
      this.boxBorder,
      this.textStyle,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 60.0,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(30.0),
          color: bgColor ?? foodColorPrimary),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            // side: BorderSide(color:borderColor ?? Colors.transparent,width: 1 )
          ),
          elevation: 4,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ??Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold, color:textColor?? Colors.white,fontFamily: FoodTheme.fontFamily),
        ),
      ),
    );
  }
}
