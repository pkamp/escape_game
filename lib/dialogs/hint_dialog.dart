import 'package:escape_game/config.dart';
import 'package:escape_game/dialogs/mail_dialog.dart';
import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:escape_game/features/countdown/countdown_provider.dart';
import 'package:escape_game/widgets/interactive_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HintDialog extends HookWidget {
  const HintDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackButton(
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) => MailDialog(),
              );
            },
          ),
          CloseButton(),
        ],
      ),
      content: Stack(
        children: [
          InteractiveCanvas(
            imageName: 'assets/globe.png',
            width: 1288,
            fields: [
              InteractiveField(
                top: 511,
                left: 557,
                width: 7,
                height: 7,
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Config.DoorCode),
                        CloseButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                color: Colors.white,
                iconSize: 48,
                icon: Icon(Icons.help),
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => Consumer(
                    builder: (context, watch, child) {
                      bool visible = watch(secondDoorHintVisible).state;
                      List<Widget> children = [
                        Text("\u2022 ${Config.GlobeHint1}"),
                        SizedBox(height: 20)
                      ];
                      if (visible)
                        children.add(Text("\u2022 ${Config.GlobeHint2}"));
                      else
                        children.add(
                          TextButton(
                            onPressed: () => context
                                .read(secondDoorHintVisible)
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
            ),
          ),
        ],
      ),
    );
  }
}
