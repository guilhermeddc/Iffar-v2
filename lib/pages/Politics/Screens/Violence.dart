import 'package:flutter_app/widgets/ImageScreen.dart';
import 'package:flutter_app/widgets/ItemList.dart';
import 'package:flutter_app/widgets/LinkButton.dart';
import 'package:flutter_app/widgets/TitleList.dart';
import 'package:flutter_app/widgets/TitleScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Violence extends StatefulWidget {
  @override
  _ViolenceState createState() => _ViolenceState();
}

class _ViolenceState extends State<Violence> {
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
                          TitleScreen("Política de não violência", 30),
                          ImageScreen("paz.png"),
                          TitleList("Política de não violência"),
                          ItemList(
                              "Estabelecer conceitos, princípios, diretrizes e ações institucionais de sensibilização para a não violência;"),
                          ItemList(
                              "Incentivar a sensibilização, a problematização e a produção de novas formas de abordar as relações humanas, pautadas numa cultura de paz e diálogo compassivo;"),
                          ItemList(
                              "Prevenir, por meio da mediação de conflitos, a abertura de processos disciplinares no âmbito institucional;"),
                          ItemList(
                              "Incentivar a condução dos processos por meio de diretrizes não violentas e de responsabilização educativa."),
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
                "POLÍTICA DE NÃO VIOLÊNCIA",
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
    document =
        await PDFDocument.fromAsset("assets/pdf/PoliticaNaoViolencia.pdf");
    setState(() {
      _isLoading = false;
    });
  }
}
