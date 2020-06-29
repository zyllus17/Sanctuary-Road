import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../home_page.dart';

class TravelDetailsLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetNotifier, AnimationController>(
      builder: (context, notifier, animation, child) {
        return Positioned(
          top: 128.0 + (1 - animation.value) * (400 + 32 - 4),
          left: 24 + MediaQuery.of(context).size.width - notifier.offset,
          child: Opacity(
            opacity: math.max(0, 4 * notifier.page - 3),
            child: child,
          ),
        );
      },
      child: Text(
        'Travel details',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
