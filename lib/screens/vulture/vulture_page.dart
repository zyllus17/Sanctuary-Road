import 'package:flutter/material.dart';
import 'package:routing/screens/map/map_hider.dart';
import 'package:routing/screens/vulture/vulture_circle.dart';

class VulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MapHider(
        child: VultureCircle(),
      ),
    );
  }
}
