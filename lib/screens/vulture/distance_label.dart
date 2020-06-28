import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../theme/styles.dart';
import '../home_page.dart';

class DistanceLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 400 + 32 + 16 + 32 + 40,
          width: MediaQuery.of(context).size.width,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Center(
        child: Text(
          '72 km',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
    );
  }
}
