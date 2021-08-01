import 'package:escape_game/dialogs/desktop_dialog.dart';
import 'package:escape_game/dialogs/printer_dialog.dart';
import 'package:escape_game/dialogs/qr_code_dialog.dart';
import 'package:escape_game/dialogs/tablet_dialog.dart';
import 'package:escape_game/widgets/app_title.dart';
import 'package:escape_game/widgets/interactive_canvas.dart';
import 'package:flutter/material.dart';

class OfficeScreen extends StatelessWidget {
  const OfficeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitle(),
      body: Center(
        child: InteractiveCanvas(
          imageName: 'assets/escape_buero.png',
          fields: [
            // Drucker
            InteractiveField(
              top: 350,
              left: 20,
              width: 115,
              height: 80,
              onTap: () => showDialog(
                context: context,
                builder: (_) => PrinterDialog(),
              ),
            ),
            // Desktop
            InteractiveField(
              top: 255,
              left: 622,
              width: 200,
              height: 115,
              onTap: () => showDialog(
                context: context,
                builder: (_) => DesktopDialog(),
              ),
            ),
            // Tablet
            InteractiveField(
              top: 440,
              left: 975,
              width: 37,
              height: 55,
              onTap: () => showDialog(
                context: context,
                builder: (_) => TabletDialog(),
              ),
            ),
            // QR Code
            InteractiveField(
              top: 200,
              left: 500,
              width: 40,
              height: 40,
              image: Image.asset(
                'assets/qrcode.png',
                width: 40,
                height: 40,
              ),
              onTap: () => showDialog(
                context: context,
                builder: (_) => QrCodeDialog(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
