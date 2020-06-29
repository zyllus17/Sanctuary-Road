import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/styles.dart';

class ArrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationController>(
      builder: (context, animation, child) {
        return Positioned(
          top: 128.0 + (1 - animation.value) * (400 + 32 - 4),
          right: 24,
          child: child,
        );
      },
      child: Icon(
        Icons.keyboard_arrow_up,
        size: 28,
        color: lighterGrey,
      ),
    );
  }
}
