import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/screens/leopard/small_animal_icon_label.dart';
import 'package:routing/screens/map/map_animation_notifier.dart';

class LeopardIconLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AnimationController, MapAnimationNotifier>(
      builder: (context, animation, notifier, child) {
        double opacity;
        if (animation.value < 3 / 4) {
          opacity = 0;
        } else if (notifier.value == 0) {
          opacity = 4 * (animation.value - 3 / 4);
        } else if (notifier.value < 0.33) {
          opacity = 1 - 3 * notifier.value;
        } else {
          opacity = 0;
        }
        return Positioned(
          top: endTop(context) + oneThird(context) - 28 - 16 - 7,
          left: 10 + opacity * 16,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: SmallAnimalIconLabel(
        isVulture: false,
        showLine: true,
      ),
    );
  }
}
