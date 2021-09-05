import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:confetti/confetti.dart';
import 'package:escape_game/confetti_hook.dart';
import 'package:escape_game/dialogs/endscreen_mail_dialog.dart';
import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:escape_game/widgets/app_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

class EndScreen extends HookWidget {
  const EndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = use(ConfettiControllerHook());
    return Scaffold(
      appBar: AppTitle(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/lama.jpg",
                  height: 200,
                ),
                ConfettiWidget(
                  confettiController: controller,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: true,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Herzlichen Glückwunsch - Ihr habt alle Rätsel gelöst!",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        width: 100,
        height: 100,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Badge(
              showBadge: !useProvider(endScreenMailVisited).state,
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
              controller.play();
              context.read(endScreenMailVisited).state = true;
              showDialog(
                context: context,
                builder: (_) => EndScreenMailDialog(),
              );
            },
          ),
        ),
      ),
    );
  }
}
