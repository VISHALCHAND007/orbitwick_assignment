import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title;
  final Color? textColor;
  final double? fontSize;
  final TextAlign? align;

  const TextTitle({
    super.key,
    required this.title,
    this.textColor,
    this.fontSize,
    this.align
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        overflow: .ellipsis,
        color: textColor ?? Colors.white,
        fontWeight: .bold,
      ),
      maxLines: 1,
      textAlign: align ?? .center,
    );
  }
}
