import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CodeTextField extends HookWidget {
  final String label;
  final bool isSolved;
  final TextEditingController controller;
  final void Function(String) onChanged;
  const CodeTextField(
    this.label,
    this.isSolved,
    this.controller,
    this.onChanged,
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: isSolved
            ? Icon(
                Icons.folder_open,
                color: Colors.amber,
              )
            : Icon(
                Icons.folder,
                color: Colors.amber,
              ),
        labelText: label,
      ),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      onChanged: (value) => onChanged(value),
      maxLength: 4,
    );
  }
}
