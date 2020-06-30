import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'map_animation_notifier.dart';

class MapBaseCamp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapAnimationNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * (notifier.value - 3 / 4));
        return Positioned(
          top: topMargin(context) + 32 + 16 + 4,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          right: 30.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Base camp',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
