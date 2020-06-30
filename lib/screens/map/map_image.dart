import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/screens/map/map_animation_notifier.dart';
import 'dart:math' as math;

class MapImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapAnimationNotifier>(
      builder: (context, notifier, child) {
        double scale = 1 + 0.3 * (1 - notifier.value);
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..scale(scale, scale)
            ..rotateZ(0.05 * math.pi * (1 - notifier.value)),
          child: Opacity(
            opacity: notifier.value,
            child: child,
          ),
        );
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          'assets/map-min.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
