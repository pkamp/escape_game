import 'package:flutter/material.dart';

class PrinterDialog extends StatelessWidget {
  const PrinterDialog({Key? key}) : super(key: key);

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
      content: Row(
        children: [
          Expanded(
            child: Image.asset(
              'assets/ecuador.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/ecuador_puzzle.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
