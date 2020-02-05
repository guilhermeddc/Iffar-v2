
import 'package:flutter_app/widgets/ImageScreen.dart';
import 'package:flutter_app/widgets/ItemList.dart';
import 'package:flutter_app/widgets/LinkButton.dart';
import 'package:flutter_app/widgets/SubTitleList.dart';
import 'package:flutter_app/widgets/TitleList.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Nutritional extends StatefulWidget {
  @override
  _NutritionalState createState() => _NutritionalState();
}

class _NutritionalState extends State<Nutritional> {
  bool _isLoading = false, _isInit = true;
  PDFDocument document;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: _isInit
                    ? ListView(
                        children: <Widget>[
                          TitleScreen("Segurança alimentar e nutricional", 30),
                          ImageScreen("Burger.png"),
                          SubTitleList("Finalidades do programa:"),
                          SizedBox(height: 16.0),
                          ItemList(
                              "Garantir aos estudantes acesso aos refeitórios e à alimentação adequada no período em que estão na Instituição;"),
                          ItemList(
                              "Contribuir para formação de práticas alimentares saudáveis dos alunos;"),
                          ItemList(
                              "Regulamentar as formas de acesso dos usuários do Programa;"),
                          ItemList(
                              "Normatizar as formas de aquisição, distribuição e preparo dos alimentos pela instituição."),
                          SizedBox(height: 30.0),
                        ],
                      )
                    : _isLoading
                        ? Center(
                            child: ListView(
                              children: <Widget>[
                                CircularProgressIndicator(),
                                SizedBox(height: 70.0),
                              ],
                            ),
                          )
                        : PDFViewer(
                            document: document,
                          ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              height: 65,
              width: 1000,
              color: Colors.green,
              child: Text(
                "SEGURANÇA ALIMENTAR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            LinkButton("https://www.iffarroupilha.edu.br/assistência-estudantil/apresentacao-ae"),
            SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              heroTag: 'btn1',
              child: Icon(Icons.book),
              onPressed: () {
                _loadFronAsstes();
              },
            ),
          ],
        ),
      ),
    );
  }

  _loadFronAsstes() async {
    setState(() {
      _isInit = false;
      _isLoading = true;
    });
    document = await PDFDocument.fromAsset(
        "assets/pdf/ProgramaSegurancaAlimentarNutricional.pdf");
    setState(() {
      _isLoading = false;
    });
  }
}
