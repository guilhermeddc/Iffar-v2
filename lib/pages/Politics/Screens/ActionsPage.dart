
import 'package:flutter_app/widgets/ImageScreen.dart';
import 'package:flutter_app/widgets/ItemList.dart';
import 'package:flutter_app/widgets/LinkButton.dart';
import 'package:flutter_app/widgets/SubTitleList.dart';
import 'package:flutter_app/widgets/TitleList.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class ActionsPage extends StatefulWidget {
  @override
  _ActionsPageState createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> {
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
                          TitleScreen("Ações afirmativas", 30),
                          ImageScreen("acoes.png"),
                          SizedBox(height: 16.0),
                          TitleList("Política de ações afirmativas"),
                          SizedBox(height: 16.0),
                          SubTitleList(
                              "Constitui-se em um instrumento de promoção:"),
                          ItemList("Dos valores democráticos;"),
                          ItemList(
                              "De respeito à diferença e à diversidade socioeconômica, étnico-racial e das condições das pessoas com deficiência, mediante a ampliação do acesso aos cursos;"),
                          ItemList(
                              "Do acompanhamento do percurso formativo na instituição, com a adoção de medidas que estimulem a permanência nos cursos."),
                          SizedBox(height: 20.0),
                        ],
                      )
                    : _isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
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
                "POLÍTICA DE AÇÕES AFIRMATIVAS",
                style: TextStyle(color: Colors.white, fontSize: 15,),
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
              heroTag: "btn1",
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
        "assets/pdf/PoliticaAcoesAfirmativasiFFar.pdf");
    setState(() {
      _isLoading = false;
    });
  }
}
