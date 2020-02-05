import 'package:flutter_app/widgets/ImageScreen.dart';
import 'package:flutter_app/widgets/ItemList.dart';
import 'package:flutter_app/widgets/LinkButton.dart';
import 'package:flutter_app/widgets/TitleList.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Inclusion extends StatefulWidget {
  @override
  _InclusionState createState() => _InclusionState();
}

class _InclusionState extends State<Inclusion> {
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
                          TitleScreen("Diversidade e inclusão", 30),
                          ImageScreen("diversity.jpg"),
                          TitleList("Política de diversidade e inclusão:"),
                          SizedBox(height: 16.0),
                          ItemList(
                              "Estabelecer conceitos, principios, diretrizes e ações institucionais de promoção da inclusão;"),
                          ItemList(
                              "Demarcar postura institucional de repúdio à discriminação ao racismo e a atos preconceituosos e violentos;"),
                          ItemList(
                              "Incentivar o reconhecimento, a problematização e a produção de novas formas de abordar as relações humanas, pautadas numa cultura de paz, diálogo compassivo."),
                          SizedBox(height: 50.0),
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
                "DIVERSIDADE E INCLUSAO",
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
              heroTag: "btn1",
              child: Icon(
                Icons.book,
              ),
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
        "assets/pdf/PoliticaDiversidadeInclusao.pdf");
    setState(() {
      _isLoading = false;
    });
  }
}
