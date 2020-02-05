import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextHistory extends StatelessWidget {
  final String text;

  TextHistory(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(text,
            textAlign: TextAlign.justify,
            textWidthBasis: TextWidthBasis.parent,
            style: TextStyle(wordSpacing: 1.5),
          ),
        ),
      ),
    );
  }
}
