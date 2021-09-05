import 'dart:html' as html;
import 'dart:js' as js;

import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:escape_game/widgets/interactive_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'hint_dialog.dart';

class EndScreenMailDialog extends HookWidget {
  const EndScreenMailDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CloseButton(),
        ],
      ),
      content: Stack(
        children: [
          InteractiveCanvas(
            imageName: 'assets/endmail.png',
            fields: [
              InteractiveField(
                top: 710,
                left: 30,
                width: 150,
                height: 50,
                onTap: () {
                  String url = html.window.location.href
                          .substring(0, html.window.location.href.length - 2) +
                      "assets/Hilfekarte.pdf";
                  js.context.callMethod('open', [url]);
                },
              ),
            ],
          ),
          Positioned(
            top: 120,
            left: 170,
            child: Text(
              context.read(endDate).state,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w500)
                  .copyWith(fontFamily: "Constantia"),
            ),
          ),
        ],
      ),
    );
  }
}
