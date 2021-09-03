import 'package:escape_game/config.dart';
import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:escape_game/features/countdown/countdown.dart';
import 'package:escape_game/widgets/lock.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      leadingWidth: 130,
      automaticallyImplyLeading: false,
      title: Consumer(
        builder: (BuildContext context,
                T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) =>
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lock("Rätsel 1", watch(doorSolved).state),
            Lock("Rätsel 2", watch(allCodesSolved).state),
            Lock("Rätsel 3", watch(tabletSolved).state),
            Lock("Rätsel 4", watch(passwordSolved).state),
          ],
        ),
      ),
      actions: [
        Consumer(
          builder: (context, watch, child) {
            var hint = watch(currentHint).state;
            return IconButton(
              tooltip: hint != null ? "Hinweis anzeigen" : null,
              onPressed: () => hint != null
                  ? showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(hint),
                            CloseButton(
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    )
                  : null,
              icon: Icon(Icons.help),
              color: Colors.white,
              iconSize: 36,
            );
          },
        )
      ],
    );
  }
}
