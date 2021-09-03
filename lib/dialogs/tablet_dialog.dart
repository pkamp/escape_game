import 'dart:html' as html;
import 'dart:js' as js;

import 'package:escape_game/config.dart';
import 'package:escape_game/dialogs/info_text_dialog.dart';
import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabletDialog extends HookWidget {
  const TabletDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.lock),
          Text("Gesperrt"),
          CloseButton(),
        ],
      ),
      content: Column(
        children: [
          TextField(
            obscureText: true,
            onChanged: (value) {
              if (value == Config.TabletCode) {
                context.read(tabletSolved).state = true;
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    scrollable: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text("Auf dem Tablet ist ein Dokument geöffnet"),
                        ),
                        CloseButton(),
                      ],
                    ),
                    content: Column(
                      children: [
                        TextButton.icon(
                          onPressed: () async {
                            String url = html.window.location.href.substring(
                                    0, html.window.location.href.length - 2) +
                                "assets/Interview.pdf";
                            js.context.callMethod('open', [url]);
                          },
                          icon: Icon(
                            Icons.document_scanner,
                          ),
                          label: Text("Öffnen"),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          MaterialButton(
            onPressed: () async => await launch(Config.TabletPuzzleUrl),
            child: Text("Passwort vergessen?"),
          ),
        ],
      ),
    );
  }
}
