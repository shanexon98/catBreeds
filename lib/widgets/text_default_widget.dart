import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDefault extends StatelessWidget {
  const TextDefault(
      {Key? key,
      required this.sizeText,
      required this.colorText,
      required this.text,
      this.fontWeight = FontWeight.w400,
      this.textAlign,
      this.overflow = TextOverflow.ellipsis,
      this.textDecoration})
      : super(key: key);

  final double sizeText;
  final Color colorText;
  final String text;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.happyMonkey(
        textStyle: TextStyle(
            overflow: overflow,
            color: colorText,
            fontSize: sizeText,
            fontWeight: fontWeight,
            decoration: textDecoration),
      ),
    );
  }
}
