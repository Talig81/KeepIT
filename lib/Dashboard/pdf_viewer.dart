import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

String _documentPath = 'images/fatura_Continente.pdf';

class PreparePdf extends StatefulWidget {
  PreparePdf({Key key}) : super(key: key);

  @override
  _PreparePdf createState() => _PreparePdf();

  static prepareTestPdf1(BuildContext context) {
    return prepareTestPdf2(context);
  }
}

class _PreparePdf extends State<PreparePdf> {
  // This moves the PDF file from the assets to a place accessible by our PDF viewer.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opening a PDF"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {},
              child: const Text('Open PDF with full_pdf_viewer'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> prepareTestPdf2(BuildContext context) async {
  final ByteData bytes =
      await DefaultAssetBundle.of(context).load(_documentPath);
  final Uint8List list = bytes.buffer.asUint8List();

  final tempDir = await getTemporaryDirectory();
  final tempDocumentPath = '${tempDir.path}/$_documentPath';

  final file = await File(tempDocumentPath).create(recursive: true);
  file.writeAsBytesSync(list);
  return tempDocumentPath;
}

class FullPdfViewerScreen extends StatelessWidget {
  String pdfPath = _documentPath;

  FullPdfViewerScreen(this.pdfPath);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text(
            'KeepIT',
            style: new TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 30,
              wordSpacing: 15,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.teal[500],
        ),
        path: pdfPath);
  }
}
