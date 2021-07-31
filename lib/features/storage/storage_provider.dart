import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localstorage/localstorage.dart';

var storage = Provider(
  (ref) => LocalStorage("escape_game"),
);
