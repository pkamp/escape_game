import 'dart:html' as html;
import 'dart:js' as js;

import 'package:escape_game/config.dart';
import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabletDialog extends HookWidget {
  const TabletDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        var solved = watch(tabletSolved).state;
        if (!solved) {
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
        } else {
          return AlertDialog(
            scrollable: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.lock_open),
                Text("Entsperrt"),
                CloseButton(),
              ],
            ),
            content: Column(
              children: [
                Text("Auf dem Tablet ist ein Dokument geöffnet"),
                SizedBox(height: 50),
                TextButton.icon(
                  onPressed: () async {
                    String url = html.window.location.href.substring(
                            0, html.window.location.href.length - 2) +
                        "assets/ITT.pdf";
                    js.context.callMethod('open', [url]);
                  },
                  icon: Icon(
                    Icons.document_scanner,
                  ),
                  label: Text("Öffnen"),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
