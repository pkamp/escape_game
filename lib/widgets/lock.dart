import 'package:flutter/material.dart';

class Lock extends StatelessWidget {
  final bool isSolved;
  final String name;

  const Lock(
    this.name,
    this.isSolved,
  );

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: isSolved ? name + " gelöst" : name,
      child: Icon(
        isSolved ? Icons.lock_open : Icons.lock,
        color: isSolved ? Colors.lightGreen : Colors.white,
        size: 48,
      ),
    );
  }
}
