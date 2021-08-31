import 'dart:html' as html;
import 'dart:js' as js;

import 'package:escape_game/config.dart';
import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:escape_game/widgets/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DesktopDialog extends HookWidget {
  const DesktopDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var costa = useTextEditingController(
      text: context.read(costaCode).state,
    );
    var sierra = useTextEditingController(
      text: context.read(sierraCode).state,
    );
    var oriente = useTextEditingController(
      text: context.read(orienteCode).state,
    );
    var pw = useTextEditingController(
      text: context.read(password).state,
    );

    return AlertDialog(
      scrollable: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Gib die vierstelligen Zahlencodes ein"),
          CloseButton(),
        ],
      ),
      content: Consumer(
        builder: (context, watch, child) {
          if (watch(allCodesSolved).state) {
            return Column(
              children: [
                Text(
                  "Geschafft! In dem Ordner \"Oriente\" befindet sich ein Interview.",
                ),
                SizedBox(height: 50),
                TextButton.icon(
                  onPressed: () async {
                    String url = html.window.location.href.substring(
                            0, html.window.location.href.length - 2) +
                        "assets/Interview.pdf";
                    js.context.callMethod('open', [url]);
                  },
                  icon: Icon(
                    Icons.file_present,
                  ),
                  label: Text("Öffnen"),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: pw,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    labelText: "Passwort",
                  ),
                  onChanged: (value) => context.read(password).state = value,
                  obscureText: true,
                  maxLength: 19,
                ),
              ],
            );
          } else {
            return Column(
              children: [
                CodeTextField(
                  "Costa",
                  watch(costaCode).state == Config.CostaCode.toString(),
                  costa,
                  (value) => context.read(costaCode).state = value,
                ),
                CodeTextField(
                  "Sierra",
                  watch(sierraCode).state == Config.SierraCode.toString(),
                  sierra,
                  (value) => context.read(sierraCode).state = value,
                ),
                CodeTextField(
                  "Oriente",
                  watch(orienteCode).state == Config.OrienteCode.toString(),
                  oriente,
                  (value) => context.read(orienteCode).state = value,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
