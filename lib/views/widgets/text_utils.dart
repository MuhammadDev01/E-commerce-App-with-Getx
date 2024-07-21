import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  const TextUtils({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.white,
    this.textDecoration,
    this.decorationColor,
  });
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
        textStyle: TextStyle(
          decoration: textDecoration,
          decorationColor: decorationColor,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
