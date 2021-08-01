import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:painter/painter.dart';

class PainterControllerHook extends Hook<PainterController> {
  const PainterControllerHook({
    this.backgroundColor = Colors.transparent,
    this.drawColor = Colors.black,
    this.thickness = 10,
    List<Object?>? keys,
  }) : super(keys: keys);

  final Color backgroundColor;
  final Color drawColor;
  final double thickness;

  @override
  HookState<PainterController, Hook<PainterController>> createState() =>
      _PainterControllerHookState();
}

class _PainterControllerHookState
    extends HookState<PainterController, PainterControllerHook> {
  late final controller = PainterController()
    ..backgroundColor = hook.backgroundColor
    ..drawColor = hook.drawColor
    ..thickness = hook.thickness;

  @override
  void initHook() {
    super.initHook();
    controller.addListener(_listener);
  }

  @override
  PainterController build(BuildContext context) => controller;

  void _listener() {
    setState(() {});
  }

  @override
  void dispose() {
    controller.removeListener(_listener);
    controller.dispose();
  }

  @override
  String get debugLabel => 'usePainterController';

  @override
  Object? get debugValue => controller;
}
