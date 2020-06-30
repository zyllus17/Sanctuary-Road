import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/screens/leopard/small_animal_icon_label.dart';
import 'dart:math' as math;
import 'map_animation_notifier.dart';

class MapVultures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapAnimationNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * (notifier.value - 3 / 4));
        return Positioned(
          top: topMargin(context) + 32 + 16 + 4 + 2 * oneThird(context),
          right: 50,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: SmallAnimalIconLabel(
        isVulture: true,
        showLine: false,
      ),
    );
  }
}
