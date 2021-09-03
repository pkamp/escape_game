import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QrCodeDialog extends HookWidget {
  const QrCodeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                    left: 155,
                    top: 155,
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
                                width: 19.33,
                                height: 19.33,
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
