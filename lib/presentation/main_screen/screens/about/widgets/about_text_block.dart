import 'package:flutter/material.dart';

class AboutTextBlock extends StatelessWidget {
  final String title;
  final TextStyle textStyle;

  const AboutTextBlock({
    super.key,
    required this.title,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
