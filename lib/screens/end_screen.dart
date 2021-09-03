import 'dart:convert';

import 'package:confetti/confetti.dart';
import 'package:escape_game/widgets/app_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

class EndScreen extends StatefulWidget {
  const EndScreen();

  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  late ConfettiController _controller;

  @override
  void initState() {
    _controller = ConfettiController(
      duration: const Duration(seconds: 10),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitle(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  "Herzlichen Glückwunsch - Ihr habt alle Rätsel gelöst!",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 50,
                ),
                ConfettiWidget(
                  confettiController: _controller,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: true,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ],
                ),
                TextButton.icon(
                  onPressed: () async {
                    _controller.play();
                    _downloadAsset("Interview.pdf");
                    _downloadAsset("ReporterOhneGrenzen.pdf");
                    _downloadAsset("ITT.pdf");
                  },
                  icon: Icon(Icons.download),
                  label: Text("Alle Unterlagen herunterladen"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _downloadAsset(String assetName) async {
    http.Response response = await http.get(
      Uri.parse(html.window.location.href
              .substring(0, html.window.location.href.length - 2) +
          "assets/$assetName"),
    );
    html.AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64Encode(response.bodyBytes)}")
      ..setAttribute("download", assetName)
      ..click();
  }
}
