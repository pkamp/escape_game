import 'dart:html' as html;
import 'dart:js' as js;

import 'package:escape_game/config.dart';
import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:escape_game/features/countdown/countdown_provider.dart';
import 'package:escape_game/screens/end_screen.dart';
import 'package:escape_game/widgets/code_text_field.dart';
import 'package:flutter/cupertino.dart';
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

    return Consumer(
      builder: (context, watch, child) {
        if (watch(allCodesSolved).state) {
          return AlertDialog(
            scrollable: true,
            title: Row(
              children: [
                Expanded(child: Text("Geschafft!")),
                CloseButton(),
              ],
            ),
            content: Column(
              children: [
                Text(
                  "In dem Ordner \"Oriente\" befindet sich ein Interview.",
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
                      Icons.qr_code,
                    ),
                    labelText: "QR Code",
                  ),
                  onChanged: (value) {
                    context.read(password).state = value;
                    if (value == Config.Password) {
                      context.read(countdownProvider.notifier).stop();

                      String url = html.window.location.href.substring(
                              0, html.window.location.href.length - 2) +
                          "assets/ReporterOhneGrenzen.pdf";
                      js.context.callMethod('open', [url]);

                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => EndScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  obscureText: true,
                  maxLength: 19,
                ),
              ],
            ),
          );
        } else {
          return AlertDialog(
            scrollable: true,
            title: Row(
              children: [
                Expanded(child: Text("Gib die vierstelligen Zahlencodes ein")),
                IconButton(
                  icon: Icon(Icons.help),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => Consumer(
                      builder: (context, watch, child) {
                        bool visible = watch(secondDesktopHintVisible).state;
                        List<Widget> children = [
                          Text("\u2022 ${Config.DesktopHint1}"),
                          SizedBox(height: 20)
                        ];
                        if (visible)
                          children.add(Text("\u2022 ${Config.DesktopHint2}"));
                        else
                          children.add(
                            TextButton(
                              onPressed: () => context
                                  .read(secondDesktopHintVisible)
                                  .state = true,
                              child: Text("Weiteren Hinweis anzeigen"),
                            ),
                          );
                        return AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(child: Text("Hinweis")),
                              CloseButton(
                                color: Colors.black,
                              ),
                            ],
                          ),
                          content: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: children,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                CloseButton(),
              ],
            ),
            content: Column(
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
            ),
          );
        }
      },
    );
  }
}
