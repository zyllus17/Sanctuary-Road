import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page.dart';

class VultureImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          left:
              1.2 * MediaQuery.of(context).size.width - 0.85 * notifier.offset,
          child: child,
        );
      },
      child: IgnorePointer(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 90.0),
          child: Image.asset(
            'assets/vulture.png',
            height: MediaQuery.of(context).size.height / 3,
          ),
        ),
      ),
    );
  }
}
