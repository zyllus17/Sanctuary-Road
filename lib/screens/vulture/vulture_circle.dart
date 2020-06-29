import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../theme/styles.dart';
import '../home_page.dart';

class VultureCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetNotifier, AnimationController>(
      builder: (context, notifier, animation, child) {
        double multiplier;
        if (animation.value == 0) {
          multiplier = math.max(0, 4 * notifier.page - 3);
        } else {
          multiplier = math.max(0, 1 - 6 * animation.value);
        }

        double size = MediaQuery.of(context).size.width * 0.5 * multiplier;
        return Container(
          margin: const EdgeInsets.only(bottom: 250),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lightGrey,
          ),
          width: size,
          height: size,
        );
      },
    );
  }
}
