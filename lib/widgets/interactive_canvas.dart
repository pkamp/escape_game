import 'package:escape_game/features/app_state/app_state_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InteractiveField {
  final double top;
  final double left;

  final double width;
  final double height;

  final VoidCallback? onTap;
  final Image? image;

  InteractiveField({
    required this.top,
    required this.left,
    required this.width,
    required this.height,
    required this.onTap,
    this.image,
  });
}

class InteractiveCanvas extends StatelessWidget {
  final double width;
  final double height;
  final String imageName;
  final List<InteractiveField> fields;

  const InteractiveCanvas(
      {required this.imageName,
      required this.fields,
      this.width = 1024,
      this.height = 800});

  build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Image.asset(
              imageName,
              fit: BoxFit.none,
              alignment: Alignment.topLeft,
              width: width,
              height: height,
            ),
            for (InteractiveField field in fields)
              Positioned(
                top: field.top,
                left: field.left,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: field.onTap,
                    child: field.image ??
                        Container(
                          width: field.width,
                          height: field.height,
                          color: kDebugMode
                              ? Colors.red.withOpacity(0.8)
                              : Colors.transparent,
                        ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
