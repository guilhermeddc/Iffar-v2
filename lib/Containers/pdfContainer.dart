import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PdfContainer extends StatefulWidget {
  final bool load, init;
  final String text;
  final String pdfUrl;
  final Widget content;

  PdfContainer(this.content, this.text, this.pdfUrl,
      {this.init = true, this.load = false});

  @override
  _PdfContainerState createState() => _PdfContainerState();
}

class _PdfContainerState extends State<PdfContainer> {
  PDFDocument document;

  get isInit => widget.init;
  get isLoading => widget.load;
  String get pdf => widget.pdfUrl;
  String get text => widget.text;
  Widget get content => widget.content;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: isInit
                    ? ListView(
                        children: <Widget>[
                          content,
                          SizedBox(height: 30.0),
                        ],
                      )
                    : isLoading
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
                text,
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
                _loadFronAsstes(isInit, isLoading, pdf, document);
              },
            ),
          ],
        ),
      ),
    );
  }

  _loadFronAsstes(init, load, url, doc) async {
    setState(() {
      init = false;
      load = true;
    });
    doc = await PDFDocument.fromAsset("assets/pdf/Organograma.pdf");
    setState(() {
      load = false;
    });
  }
}
