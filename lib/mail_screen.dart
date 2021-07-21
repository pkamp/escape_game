import 'package:flutter/material.dart';

import 'hint_screen.dart';

class MailScreen extends StatelessWidget {
  const MailScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Krusel Mail"),
      ),
      body: Center(
        child: SizedBox(
          width: 1024,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset('assets/mail.png'),

                // Hinweis
                Positioned(
                  top: 740,
                  left: 30,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HintScreen(),
                      ),
                    ),
                    child: Container(
                      width: 150,
                      height: 50,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
