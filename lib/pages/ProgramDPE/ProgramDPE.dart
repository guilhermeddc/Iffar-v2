import 'package:flutter_app/widgets/ImageScreen.dart';
import 'package:flutter_app/widgets/ItemList.dart';
import 'package:flutter_app/widgets/LinkButton.dart';
import 'package:flutter_app/widgets/TitleList.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';
import 'package:flutter/material.dart';

class ProgramDPE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Programa de Permanência e Êxito"
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: ListView(
            children: <Widget>[
              TitleScreen("Programa de Permanência e Êxito", 30),
              ImageScreen("dpe.jpg"),
              TitleList("Programa de Permanência e Êxito"),
              ItemList("Propor e assessorar o desenvolvimento de ações específicas que minimizem a influência dos fatores responsáveis pelo processo evasão e retenção;"),
              ItemList("Instigar o sentimento de pertencimento ao IFFar;"),
              ItemList("Atuar de forma preventiva nas causas de evasão e retenção."),
            ],
          ),
        ),
        floatingActionButton: LinkButton(""),
      ),
    );
  }
}
