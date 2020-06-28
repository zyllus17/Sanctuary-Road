import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/screens/home_page.dart';
import 'package:routing/screens/leopard/leopard_description.dart';
import 'package:routing/screens/leopard/the_72_text.dart';
import 'package:routing/screens/leopard/travel_description_label.dart';

class LeopardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 128),
        The72Text(),
        SizedBox(height: 32),
        TravelDescriptionLabel(),
        SizedBox(height: 32),
        LeopardDescription(),
      ],
    );
  }
}
