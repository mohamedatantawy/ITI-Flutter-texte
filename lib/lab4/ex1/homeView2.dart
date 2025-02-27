import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Homeview2 extends StatelessWidget {
  const Homeview2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => _createpdf(),
              child: Text('PDF'),
            ),
          ),
        ],
      ),
    );
  }
}

void _createpdf() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Column(
          children: [
            pw.SizedBox(
              width: double.infinity,
              child: pw.FittedBox(
                child: pw.Text(
                  'mohamed tantawy',
                  style: pw.TextStyle(font: pw.Font.courierBold()),
                ),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Flexible(child: pw.FlutterLogo()),
            // pw.SizedBox(
            //   width: double.infinity,
            //   child: pw.FittedBox(
            //     child: pw.Text(
            //       'mohamed tantawy',
            //       style: pw.TextStyle(font: pw.Font.courierBold()),
            //     ),
            //   ),
            // ),
            // pw.SizedBox(height: 20),
            // pw.Flexible(child: pw.FlutterLogo()),
          ],
        );
      },
    ),
  );

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Column(
          children: [
            pw.SizedBox(
              width: double.infinity,
              child: pw.FittedBox(
                child: pw.Text(
                  'mohamed tantawy',
                  style: pw.TextStyle(font: pw.Font.courierBold()),
                ),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Flexible(child: pw.FlutterLogo()),
            // pw.SizedBox(
            //   width: double.infinity,
            //   child: pw.FittedBox(
            //     child: pw.Text(
            //       'mohamed tantawy',
            //       style: pw.TextStyle(font: pw.Font.courierBold()),
            //     ),
            //   ),
            // ),
            // pw.SizedBox(height: 20),
            // pw.Flexible(child: pw.FlutterLogo()),
          ],
        );
      },
    ),
  );

  // return pdf.save();

  await Printing.layoutPdf(onLayout: (format) => pdf.save());
  print('yesdkldfasdfjlksdfjldf');
}
