import 'package:flutter/material.dart';
import 'package:notoan/utils/constants/fonts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double horizontalPadding;
  final double verticalPadding;

  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFF479C2B), // Default to old green
    this.textColor = Colors.white,
    this.borderRadius = 30.0,
    this.horizontalPadding = 32.0,
    this.verticalPadding = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontFamily: AppFonts.outfit,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
