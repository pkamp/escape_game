import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ConfettiControllerHook extends Hook<ConfettiController> {
  const ConfettiControllerHook({
    List<Object?>? keys,
  }) : super(keys: keys);

  @override
  HookState<ConfettiController, Hook<ConfettiController>> createState() =>
      _ConfettiControllerHookState();
}

class _ConfettiControllerHookState
    extends HookState<ConfettiController, ConfettiControllerHook> {
  late final controller = ConfettiController();

  @override
  void initHook() {
    super.initHook();
    controller.addListener(_listener);
  }

  @override
  ConfettiController build(BuildContext context) => controller;

  void _listener() {
    setState(() {});
  }

  @override
  void dispose() {
    controller.removeListener(_listener);
    controller.dispose();
  }

  @override
  String get debugLabel => 'useConfettiController';

  @override
  Object? get debugValue => controller;
}
