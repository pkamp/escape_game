import 'package:escape_game/app_title.dart';
import 'package:escape_game/mail.dart';
import 'package:escape_game/office_screen.dart';
import 'package:escape_game/timer.dart';
import 'package:flutter/material.dart';

class OfficeDoor extends StatelessWidget {
  const OfficeDoor();

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
              'assets/office_door.jpg',
              width: 1024,
            ),
            // Hinweis
            Positioned(
              top: 370,
              left: 365,
              child: GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: TextField(),
                    actions: [
                      TextButton.icon(
                        onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OfficeScreen(),
                            ),
                            (route) => false),
                        icon: Icon(
                          Icons.check_circle,
                        ),
                        label: Text("Öffnen"),
                      ),
                    ],
                  ),
                ),
                child: Container(
                  width: 50,
                  height: 110,
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
