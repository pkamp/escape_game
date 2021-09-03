import 'dart:async';

import 'package:escape_game/config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var countdownProvider = StateNotifierProvider<CountdownProvider, Duration>(
  (ref) {
    return CountdownProvider(
      Duration(seconds: Config.CountdownInSeconds),
    );
  },
);

class CountdownProvider extends StateNotifier<Duration> {
  final Duration duration;
  Timer? timer;
  CountdownProvider(this.duration) : super(duration);

  void start() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        state = state - Duration(seconds: 1);
        if (state == Duration.zero) {
          timer.cancel();
        }
      },
    );
  }

  void stop() {
    timer?.cancel();
  }
}
