import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String text;

  ImageScreen(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Center(
        child: Image.asset('assets/images/$text'),
      ),
    );
  }
}