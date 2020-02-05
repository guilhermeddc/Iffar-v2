import 'package:flutter_app/widgets/ImageScreen.dart';
import 'package:flutter_app/widgets/LinkButton.dart';
import 'package:flutter_app/widgets/TitleList.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Concession extends StatefulWidget {
  @override
  _ConcessionState createState() => _ConcessionState();
}

class _ConcessionState extends State<Concession> {
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 8,
                    right: 8,
                  ),
                  child: _isInit
                      ? ListView(
                          children: <Widget>[
                            TitleScreen(
                                "Concessão de apoio financeiro aos estudantes do IFFar para participacão em eventos",
                                22.0),
                            ImageScreen("concessao.jpg"),
                            TitleList(
                                "       Subsidiar a participação em eventos de natureza científica e/ou tecnológica, desportiva, artístico-cultural e de organização estudantil."),
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
        "assets/pdf/RegulamentoApoioFinanceiroParticipacaoDiscentesEventos.pdf");
    setState(() {
      _isLoading = false;
    });
  }
}
