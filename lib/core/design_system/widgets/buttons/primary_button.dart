import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final EdgeInsets padding;
  final bool isFilled;
  final double? width;
  final Widget? icon;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.black,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    this.isFilled = false,
    this.width,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero, // không padding thêm
      onPressed: onPressed,
      child: Container(
        width: width ?? double.infinity, // nếu null => full cha
        padding: padding,
        decoration: BoxDecoration(
          color: isFilled ? backgroundColor : Colors.transparent,
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!, SizedBox(width: 8)],
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
