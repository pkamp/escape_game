import 'package:badges/badges.dart';
import 'package:escape_game/dialogs/mail_dialog.dart';
import 'package:escape_game/dialogs/office_door_lock_dialog.dart';
import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:escape_game/widgets/app_title.dart';
import 'package:escape_game/widgets/interactive_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfficeDoorScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppTitle(),
        body: Center(
          child: InteractiveCanvas(
            imageName: 'assets/office_door.jpg',
            fields: [
              InteractiveField(
                top: 420,
                left: 475,
                height: 110,
                width: 50,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => OfficeDoorLockDialog(),
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Container(
          width: 100,
          height: 100,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              child: Badge(
                showBadge: !useProvider(mailVisited).state,
                badgeColor: Colors.red,
                badgeContent: Text(
                  "1",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Icon(Icons.mail),
              ),
              onPressed: () {
                context.read(mailVisited).state = true;
                showDialog(
                  context: context,
                  builder: (_) => MailDialog(),
                );
              },
            ),
          ),
        ));
  }
}
