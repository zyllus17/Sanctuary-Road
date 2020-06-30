import 'package:flutter/material.dart';
import 'package:routing/theme/styles.dart';

class SmallAnimalIconLabel extends StatelessWidget {
  final bool isVulture;
  final bool showLine;

  const SmallAnimalIconLabel(
      {Key key, @required this.isVulture, @required this.showLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        if (showLine && isVulture)
          Container(
            margin: EdgeInsets.only(bottom: 8),
            width: 16,
            height: 1,
            color: white,
          ),
        SizedBox(width: 24),
        Column(
          children: <Widget>[
            Image.asset(
              isVulture ? 'assets/vultures.png' : 'assets/leopards.png',
              width: 28,
              height: 28,
            ),
            SizedBox(height: showLine ? 16 : 0),
            Text(
              isVulture ? 'Vultures' : 'Leopards',
              style: TextStyle(fontSize: showLine ? 14 : 12),
            )
          ],
        ),
        SizedBox(width: 24),
        if (showLine && !isVulture)
          Container(
            margin: EdgeInsets.only(bottom: 8),
            width: 16,
            height: 1,
            color: white,
          ),
      ],
    );
  }
}
