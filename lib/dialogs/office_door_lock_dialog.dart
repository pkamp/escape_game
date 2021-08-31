import 'package:escape_game/config.dart';
import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:escape_game/screens/office_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
          if (value == Config.DoorCode) {
            context.read(doorSolved).state = true;
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                  builder: (_) => OfficeScreen(),
                ),
                (route) => false);
          }
        },
      ),
    );
  }
}
