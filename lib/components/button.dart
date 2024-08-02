import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final TextStyle textStyle;
  final List<BoxShadow> boxShadow;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
    required this.borderColor,
    this.borderRadius = 16.0,
    this.borderWidth = 2.0,
    required this.textStyle,
    required this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenSize = MediaQuery.of(context).size;

    // Adjust padding and font size based on screen size
    final double adjustedPadding = screenSize.width * 0.04;
    final double adjustedFontSize = screenSize.width * 0.04;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: EdgeInsets.all(adjustedPadding),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle.copyWith(fontSize: adjustedFontSize),
          ),
        ),
      ),
    );
  }
}
