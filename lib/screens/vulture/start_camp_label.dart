import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/screens/map/map_animation_notifier.dart';
import 'package:routing/screens/map/map_hider.dart';
import 'dart:math' as math;
import '../home_page.dart';

class StartCampLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: topMargin(context) + mainSquareSize(context) + 32 + 16 + 32,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          left: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: MapHider(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Start camp',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
