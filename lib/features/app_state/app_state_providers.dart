import 'package:escape_game/config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

var dateNow = StateProvider<String>(
    (ref) => DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()));

var endDate = StateProvider<String>(
    (ref) => DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()));

var mailVisited = StateProvider<bool>(
  (ref) => false,
);

var endScreenMailVisited = StateProvider<bool>(
  (ref) => false,
);

var secondDoorHintVisible = StateProvider<bool>((ref) => false);
var secondDesktopHintVisible = StateProvider<bool>((ref) => false);

var costaCode = StateProvider<String>((ref) => '');
var sierraCode = StateProvider<String>((ref) => '');
var orienteCode = StateProvider<String>((ref) => '');

var password = StateProvider<String>((ref) => '');

var qrcode = StateProvider<List<List<bool>>>(
  (ref) =>
      List.generate(4, (i) => List.generate(15, (_) => false), growable: false),
);

var allCodesSolved = StateProvider<bool>((ref) {
  print(Config.CostaCode.toSet().difference({}).length);
  if (Config.CostaCode.toSet()
              .difference(
                ref.watch(costaCode).state.split('').toSet(),
              )
              .length ==
          0 &&
      Config.SierraCode.toSet()
              .difference(
                ref.watch(sierraCode).state.split('').toSet(),
              )
              .length ==
          0 &&
      Config.OrienteCode.toSet()
              .difference(
                ref.watch(orienteCode).state.split('').toSet(),
              )
              .length ==
          0) {
    return true;
  }
  return false;
});

var passwordSolved = StateProvider<bool>((ref) {
  return ref.watch(password).state == Config.Password;
});

var tabletSolved = StateProvider<bool>(
  (ref) => false,
);

var doorSolved = StateProvider<bool>(
  (ref) => false,
);

var currentHint = StateProvider<String?>((ref) {
  var first = ref.watch(doorSolved).state;
  var second = ref.watch(allCodesSolved).state;
  var third = ref.watch(tabletSolved).state;
  var fourth = ref.watch(passwordSolved).state;
  if (!first)
    return Config.DoorHint;
  else if (!second)
    return Config.DesktopHint;
  else if (!third)
    return Config.TabletHint;
  else if (!fourth)
    return Config.QrCodeHint;
  else
    return null;
});
