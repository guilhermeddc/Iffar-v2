import 'package:flutter_app/widgets/ImageScreen.dart';
import 'package:flutter_app/widgets/ItemList.dart';
import 'package:flutter_app/widgets/LinkButton.dart';
import 'package:flutter_app/widgets/TitleList.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                          TitleScreen("Moradia Estudantil", 30.0),
                          ImageScreen("house.png"),
                          TitleList(
                              "É um espaço de residência disponibilizado junto ao campus."),
                          ItemList(
                              "Objetivo de garantir a permanência e prevenir a evasão estudantil;"),
                          ItemList(
                              "Prioritariamente para estudantes em situação de vulnerabilidade socioeconômica;"),
                          ItemList("Menores de idade;"),
                          ItemList(
                              "Que residam em locais de difícil acesso ao campus."),
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
                "Moradia Estudantil",
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
        "assets/pdf/RegulamentoMoradiaEstudantil.pdf");
    setState(() {
      _isLoading = false;
    });
  }
}
