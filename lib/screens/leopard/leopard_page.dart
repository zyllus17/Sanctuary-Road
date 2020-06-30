import 'package:flutter/material.dart';
import 'package:routing/screens/leopard/leopard_description.dart';
import 'package:routing/screens/leopard/the_72_text.dart';
import 'package:routing/screens/leopard/travel_description_label.dart';
import 'package:routing/screens/map/map_animation_notifier.dart';

class LeopardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: topMargin(context)),
        The72Text(),
        SizedBox(height: 32),
        TravelDescriptionLabel(),
        SizedBox(height: 32),
        LeopardDescription(),
      ],
    );
  }
}
