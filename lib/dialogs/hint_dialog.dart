import 'package:escape_game/config.dart';
import 'package:escape_game/dialogs/mail_dialog.dart';
import 'package:escape_game/widgets/interactive_canvas.dart';
import 'package:flutter/material.dart';

class HintDialog extends StatelessWidget {
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
      content: InteractiveCanvas(
        imageName: 'assets/globe.png',
        fields: [
          InteractiveField(
            top: 447,
            left: 541,
            width: 7,
            height: 7,
            onTap: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Config.Password),
                    CloseButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
