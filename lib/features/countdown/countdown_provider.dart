import 'dart:async';

import 'package:escape_game/config.dart';
import 'package:escape_game/features/storage/storage_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localstorage/localstorage.dart';

var countdownProvider = StateNotifierProvider<CountdownProvider, Duration>(
  (ref) {
    return CountdownProvider(
      Duration(seconds: Config.CountdownInSeconds),
    );
  },
);

class CountdownProvider extends StateNotifier<Duration> {
  final Duration duration;

  CountdownProvider(this.duration) : super(duration) {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        state = state - Duration(seconds: 1);
        if (state == Duration.zero) {
          timer.cancel();
        }
      },
    );
  }
}
