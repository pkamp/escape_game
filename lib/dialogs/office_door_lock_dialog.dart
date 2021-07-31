import 'package:escape_game/config.dart';
import 'package:escape_game/screens/office_screen.dart';
import 'package:flutter/material.dart';

class OfficeDoorLockDialog extends StatelessWidget {
  const OfficeDoorLockDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Türschloss"),
          CloseButton(),
        ],
      ),
      content: TextField(
        onChanged: (value) {
          if (value == Config.Password) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => OfficeScreen(),
                ),
                (route) => false);
          }
        },
      ),
    );
  }
}
