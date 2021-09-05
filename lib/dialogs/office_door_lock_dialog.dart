import 'package:escape_game/config.dart';
import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:escape_game/features/countdown/countdown_provider.dart';
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
          Text("Bürotür"),
          CloseButton(),
        ],
      ),
      content: TextField(
        maxLength: Config.DoorCode.length,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
          ),
          labelText: "Passwort",
        ),
        onChanged: (value) {
          if (value == Config.DoorCode) {
            context.read(doorSolved).state = true;
            context
                .read(countdownProvider.notifier)
                .start(); // In case mail has not been visited
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
