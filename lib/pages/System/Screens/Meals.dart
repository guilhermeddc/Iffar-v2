import 'package:flutter_app/widgets/LinkButton.dart';
import 'package:flutter_app/widgets/TitleList.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';
import 'package:flutter/material.dart';

class Meals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            TitleScreen("IFFar – Refeições (cardápio)", 30),
            TitleList("Entre no link a baixo e escolha sua Unidade!")
          ],
        ),
        floatingActionButton: LinkButton("http://refeicoes.iffarroupilha.edu.br/"),
      ),
    );
  }
}
