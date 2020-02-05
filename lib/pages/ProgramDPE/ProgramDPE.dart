import 'package:flutter_app/widgets/ImageScreen.dart';
import 'package:flutter_app/widgets/ItemList.dart';
import 'package:flutter_app/widgets/TitleList.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class ProgramDPE extends StatefulWidget {
  @override
  _ProgramDPEState createState() => _ProgramDPEState();
}

class _ProgramDPEState extends State<ProgramDPE> {
  bool _isLoading = false, _isInit = true;
  PDFDocument document;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              "Programa de Permanência e Êxito"
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: _isInit
                    ? ListView(
                  children: <Widget>[
                    TitleScreen("Programa de Permanência e Êxito", 30),
                    ImageScreen("dpe.jpg"),
                    TitleList("Programa de Permanência e Êxito"),
                    ItemList("Propor e assessorar o desenvolvimento de ações específicas que minimizem a influência dos fatores responsáveis pelo processo evasão e retenção;"),
                    ItemList("Instigar o sentimento de pertencimento ao IFFar;"),
                    ItemList("Atuar de forma preventiva nas causas de evasão e retenção."),
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
            FloatingActionButton(
              heroTag: 'btn1',
              child: Icon(Icons.book),
              onPressed: () {
                _loadFronAsstes1();
              },
            ),
            SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              heroTag: 'btn1',
              child: Icon(Icons.book),
              onPressed: () {
                _loadFronAsstes2();
              },
            ),
          ],
        ),
      ),
    );
  }

  _loadFronAsstes1() async {
    setState(() {
      _isInit = false;
      _isLoading = true;
    });
    document = await PDFDocument.fromAsset(
        "assets/pdf/PlanejamentoAcoesPPE2018-2020.pdf");
    setState(() {
      _isLoading = false;
    });
  }

  _loadFronAsstes2() async {
    setState(() {
      _isInit = false;
      _isLoading = true;
    });
    document = await PDFDocument.fromAsset(
        "assets/pdf/ResolucaoProgramaPermanênciaExito.pdf");
    setState(() {
      _isLoading = false;
    });
  }
}
