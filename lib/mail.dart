import 'package:badges/badges.dart';
import 'package:escape_game/mail_screen.dart';
import 'package:flutter/material.dart';

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(right: 20),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MailScreen(),
        ),
      ),
      icon: Badge(
        badgeContent: Text(
          '1',
          style: TextStyle(color: Colors.white),
        ),
        child: Icon(
          Icons.mail,
          size: 32,
        ),
      ),
    );
  }
}
