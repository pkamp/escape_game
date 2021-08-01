import 'package:escape_game/hooks/painter_controller_hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:painter/painter.dart';

class QrCodeDialog extends HookWidget {
  const QrCodeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = use(PainterControllerHook());
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              controller.eraseMode
                  ? IconButton(
                      onPressed: () => controller.eraseMode = false,
                      icon: Icon(Icons.brush),
                    )
                  : IconButton(
                      onPressed: () => controller.eraseMode = true,
                      icon: Icon(MdiIcons.eraser),
                    ),
              IconButton(
                onPressed: () => controller.isEmpty ? null : controller.undo(),
                icon: Icon(Icons.undo),
              ),
            ],
          ),
          CloseButton(),
        ],
      ),
      content: SizedBox(
        width: 600,
        height: 600,
        child: Stack(
          children: [
            Image.asset(
              'assets/qrcode.png',
              width: 600,
              height: 600,
            ),
            Painter(controller),
          ],
        ),
      ),
    );
  }
}
