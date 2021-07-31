import 'package:escape_game/config.dart';
import 'package:flutter/material.dart';

class DesktopDialog extends StatelessWidget {
  const DesktopDialog({Key? key}) : super(key: key);

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
      content: Column(
        children: [
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
