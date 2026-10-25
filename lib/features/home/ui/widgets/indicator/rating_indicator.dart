import 'package:flutter/material.dart';

import '../text/text_subtitle.dart';

class RatingIndicator extends StatelessWidget {
  final String rating;

  const RatingIndicator({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///star icon
        Icon(Icons.star, color: Colors.green, size: 18,),

        SizedBox(width: 1,),

        ///text
        TextSubtitle(
          text: rating,
          textColor: Colors.green,
        ),
      ],
    );
  }
}
