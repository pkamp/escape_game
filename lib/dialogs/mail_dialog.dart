import 'package:escape_game/dialogs/hint_dialog.dart';
import 'package:escape_game/features/countdown/countdown_provider.dart';
import 'package:escape_game/widgets/interactive_canvas.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MailDialog extends StatelessWidget {
  const MailDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Align(
        alignment: Alignment.centerRight,
        child: CloseButton(
          onPressed: () {
            context.read(countdownProvider.notifier).start();
            Navigator.pop(context);
          },
        ),
      ),
      content: InteractiveCanvas(
        imageName: 'assets/mail.png',
        fields: [
          InteractiveField(
            top: 740,
            left: 60,
            width: 150,
            height: 50,
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) => HintDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
