import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/screens/home_page.dart';

class LeopardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/leopard.png');
  }
}

class LeopardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          top: 100,
          left: -notifier.offset,
          height: 250,
          child: Image.asset('assets/leopard.png'),
        );
      },
    );
  }
}
