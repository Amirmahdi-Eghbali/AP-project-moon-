import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

final PdfViewerController _pdfViewerController=PdfViewerController();
class PDFViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syncfusion Flutter PDF Viewer'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerController.jumpToPage(3);
              print(_pdfViewerController.scrollOffset.dy);
              print(_pdfViewerController.scrollOffset.dx);
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        'http://iran-paper.ir/Book/1984.pdf',
        controller: _pdfViewerController,
      ),
    );
  }
}