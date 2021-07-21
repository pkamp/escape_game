import 'package:escape_game/timer.dart';
import 'package:flutter/material.dart';

import 'app_title.dart';
import 'mail.dart';

class OfficeScreen extends StatelessWidget {
  const OfficeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppTitle(),
        actions: [
          Timer(),
          SizedBox(
            width: 50,
          ),
          Mail(),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'assets/escape_buero.png',
              width: 1024,
            ),
            // Drucker
            Positioned(
              top: 350,
              left: 20,
              child: GestureDetector(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Clicked"),
                  ),
                ),
                child: Container(
                  width: 115,
                  height: 80,
                  color: Colors.transparent,
                ),
              ),
            ),

            // Desktop
            Positioned(
              top: 255,
              left: 622,
              child: GestureDetector(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Clicked"),
                  ),
                ),
                child: Container(
                  width: 200,
                  height: 115,
                  color: Colors.transparent,
                ),
              ),
            ),

            // Tablet
            Positioned(
              top: 440,
              left: 975,
              child: GestureDetector(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Clicked"),
                  ),
                ),
                child: Container(
                  width: 37,
                  height: 55,
                  color: Colors.transparent,
                ),
              ),
            ),

            // QR Code
            Positioned(
              top: 200,
              left: 475,
              child: GestureDetector(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Clicked"),
                  ),
                ),
                child: Hero(
                  tag: 'qrcode',
                  child: Image.asset(
                    'assets/qrcode.png',
                    width: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
