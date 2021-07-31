import 'package:escape_game/dialogs/hint_dialog.dart';
import 'package:escape_game/widgets/interactive_canvas.dart';
import 'package:flutter/material.dart';

class MailDialog extends StatelessWidget {
  const MailDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Align(
        alignment: Alignment.centerRight,
        child: CloseButton(),
      ),
      content: InteractiveCanvas(
        imageName: 'assets/mail.png',
        fields: [
          InteractiveField(
            top: 740,
            left: 30,
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
