import 'package:flutter/material.dart';

import '../theme/styles.dart';

class ArrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
        return Positioned(
          top: 128.0 + 400 + 32 -4,
          right: 24,
          child: Icon(
          Icons.keyboard_arrow_up,
          size: 28,
          color: lighterGrey,
        ), 
    );
  }
}