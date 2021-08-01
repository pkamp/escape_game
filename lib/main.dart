import 'package:escape_game/screens/office_door_screen.dart';
import 'package:escape_game/screens/office_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
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
      home: OfficeScreen(),
    );
  }
}
