import 'package:hooks_riverpod/hooks_riverpod.dart';

var doorLockVisited = StateProvider<bool>(
  (ref) => false,
);

var mailVisited = StateProvider<bool>(
  (ref) => false,
);

var puzzlesSolved = StateProvider<int>(
  (ref) => 0,
);
