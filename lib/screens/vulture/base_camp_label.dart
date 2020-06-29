import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../home_page.dart';

class BaseCampLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetNotifier, AnimationController>(
      builder: (context, notifier, animation, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 32 + 16 + 4 + (1 - animation.value) * (400 + 32 - 4),
          width: (MediaQuery.of(context).size.width - 48) / 3,
          right: opacity * 24.0,
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
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
