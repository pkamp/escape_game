import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InfoTextDialog extends HookWidget {
  const InfoTextDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
        alignment: Alignment.centerRight,
        child: CloseButton(),
      ),
      content: SingleChildScrollView(
        child: Image.asset(
          'info_text.png',
          width: 1024,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
