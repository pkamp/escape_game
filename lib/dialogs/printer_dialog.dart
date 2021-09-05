import 'dart:html' as html;
import 'dart:js' as js;
import 'package:flutter/material.dart';

class PrinterDialog extends StatelessWidget {
  const PrinterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text("Im Drucker befindet sich ein Dokument"),
          ),
          CloseButton(),
        ],
      ),
      content: Column(
        children: [
          TextButton.icon(
            onPressed: () async {
              String url = html.window.location.href
                      .substring(0, html.window.location.href.length - 2) +
                  "assets/LandschaftenEcuadors.pdf";
              js.context.callMethod('open', [url]);
            },
            icon: Icon(
              Icons.print,
            ),
            label: Text("Öffnen"),
          ),
        ],
      ),
    );
  }
}
