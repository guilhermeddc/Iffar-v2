import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CardScreen extends StatelessWidget {
  final String img;
  final String text;

  CardScreen(this.img, this.text);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Image.asset(img, fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          )
        ],
      ),
    );
  }
}
