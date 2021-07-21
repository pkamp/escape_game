import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.lock,
          size: 48,
        ),
        Icon(
          Icons.lock,
          size: 48,
        ),
        Icon(
          Icons.lock_open,
          size: 48,
        ),
      ],
    );
  }
}
