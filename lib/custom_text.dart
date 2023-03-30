import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final EdgeInsetsGeometry padding;
  final TextDecoration textDecoration;
  final TextStyle? style;
  final double? height;

  const CustomText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 16,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.padding = EdgeInsets.zero,
    this.textDecoration = TextDecoration.none,
    this.style,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: style ??
            GoogleFonts.mulish(
              color: color ?? Colors.black,
              fontSize: fontSize,
              fontWeight: fontWeight,
              decoration: textDecoration,
              height: height,
            ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
      ),
    );
  }
}
