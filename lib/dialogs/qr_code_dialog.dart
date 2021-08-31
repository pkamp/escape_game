import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:painter/painter.dart';

class QrCodeDialog extends HookWidget {
  const QrCodeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CloseButton(),
        ],
      ),
      content: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.help,
                size: 64,
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wie viel bl. vermutet man?"),
                  Text("Wie viele Stellen sind im ITT-Block?"),
                  Text("Wie viel USD bekam Raphael?"),
                  Text(
                      "Wie viel Prozent macht das EÖ anteilig vom Export aus?"),
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
