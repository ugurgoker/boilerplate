import 'package:flutter/material.dart';
import '../../core/resources/_r.dart';

class TextBasic extends StatelessWidget {
  final String text;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final double? lineHeight;
  final bool? underline;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  const TextBasic({
    Key? key,
    required this.text,
    this.color,
    this.fontFamily,
    this.fontSize,
    this.lineHeight,
    this.underline = false,
    this.textAlign,
    this.maxLines,
    this.fontWeight,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLines ?? 999,
      textScaleFactor: 1,
      style: TextStyle(
        letterSpacing: letterSpacing ?? 0.0,
        color: color ?? R.color.black,
        fontFamily: fontFamily ?? R.fonts.interRegular,
        fontSize: fontSize ?? 14.0,
        decoration: underline! ? TextDecoration.underline : null,
        fontWeight: fontWeight ?? FontWeight.normal,
        height: lineHeight ?? 1.2,
      ),
    );
  }
}

TextSpan textSpanBasic({
  String? text,
  Color? color,
  String? fontFamily,
  FontWeight? fontWeight,
  double? fontSize,
  bool? underline = false,
}) {
  return TextSpan(
    text: text,
    style: TextStyle(
      color: color,
      fontFamily: fontFamily ?? R.fonts.interRegular,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.normal,
      decoration: underline! ? TextDecoration.underline : null,
    ),
  );
}

class RichTextBasic extends StatelessWidget {
  final List<TextSpan>? texts;
  final TextAlign? textAlign;

  const RichTextBasic({Key? key, this.texts, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        children: texts,
      ),
    );
  }
}

class TextNavigationTitle extends StatelessWidget {
  final String title;

  const TextNavigationTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextBasic(
      text: title,
      textAlign: TextAlign.center,
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    );
  }
}
