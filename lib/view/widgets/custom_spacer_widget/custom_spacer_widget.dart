import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  final double flex;

  const SpacerWidget({super.key, this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex.toInt(),
      child: const SizedBox.shrink(),
    );
  }
}
