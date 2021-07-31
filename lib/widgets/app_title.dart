import 'package:escape_game/features/countdown/countdown.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Countdown(),
      ),
      leadingWidth: 500,
      automaticallyImplyLeading: false,
      // title: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Icon(
      //       Icons.lock,
      //       size: 48,
      //     ),
      //     Icon(
      //       Icons.lock,
      //       size: 48,
      //     ),
      //     Icon(
      //       Icons.lock_open,
      //       size: 48,
      //     ),
      //   ],
      // ),
      // actions: [
      //   Countdown(),
      //   SizedBox(
      //     width: 50,
      //   ),
      // ],
    );
  }
}
