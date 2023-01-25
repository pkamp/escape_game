import 'package:escape_game/config.dart';
import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:escape_game/features/countdown/countdown_provider.dart';
import 'package:escape_game/screens/end_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QrCodeDialog extends HookWidget {
  const QrCodeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pw = useTextEditingController(
      text: context.read(password).state,
    );

    return AlertDialog(
      scrollable: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              "Markiere die richtigen Zahlen, um den QR-Code zu vervollständigen"),
          CloseButton(),
        ],
      ),
      content: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\u2022 Wie viel bl. vermutet man?"),
                  Text("\u2022 Wie viele Stellen sind im ITT-Block?"),
                  Text("\u2022 Wie viel USD bekam Rafael?"),
                  Text(
                      "\u2022 Wie viel Prozent macht das EÖ anteilig vom Export aus?"),
                ],
              )
            ],
          ),
          TextField(
            controller: pw,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.qr_code_2,
              ),
              labelText: "Lösung des QR Codes",
            ),
            onChanged: (value) async {
              context.read(password).state = value;
              if (value == Config.Password) {
                context.read(countdownProvider.notifier).stop();

                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => EndScreen(),
                  ),
                  (route) => false,
                );
              }
            },
            maxLength: Config.Password.length,
          ),
          SizedBox(
            width: 600,
            height: 600,
            child: Stack(
              children: [
                Image.asset(
                  'assets/qrcode.png',
                  width: 600,
                  height: 600,
                ),
                Positioned(
                    left: 154.2,
                    top: 154.2,
                    child: Consumer(
                      builder: (context, watch, child) {
                        var array = watch(qrcode).state;
                        List<Widget> column = [];
                        for (int i = 0; i < 4; i++) {
                          List<Widget> row = [];
                          for (int j = 0; j < 15; j++) {
                            row.add(
                              Container(
                                color: array[i][j]
                                    ? Colors.black
                                    : Colors.transparent,
                                width: 19.4,
                                height: 19.4,
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      array[i][j] = !array[i][j];
                                      context.read(qrcode).state = array;
                                    },
                                  ),
                                ),
                              ),
                            );
                          }
                          column.add(Row(
                            children: row,
                          ));
                        }

                        return Column(
                          children: column,
                        );
                      },
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
