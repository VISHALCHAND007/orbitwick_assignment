import 'package:flutter/material.dart';

class TextSubtitle extends StatelessWidget {
  final String text;
  final Color? textColor;

  const TextSubtitle({super.key, required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        overflow: .ellipsis,
        color: textColor ?? Colors.white,
      ),
      maxLines: 1,
      textAlign: .start,
    );
  }
}