import 'package:escape_game/office_door.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escape Game',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: OfficeDoor(),
    );
  }
}
