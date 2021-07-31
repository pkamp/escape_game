import 'package:escape_game/features/countdown/countdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Countdown extends HookWidget {
  @override
  Widget build(BuildContext context) {
    Duration duration = useProvider(countdownProvider);
    return Text(
      duration.toString().substring(2, 7),
      style: Theme.of(context).textTheme.headline3!.copyWith(
            color: duration == Duration.zero ? Colors.red : Colors.white,
          ),
    );
  }
}
