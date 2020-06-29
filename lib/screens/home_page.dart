import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/screens/vulture/base_camp_label.dart';
import 'package:routing/screens/vulture/distance_label.dart';
import 'package:routing/widgets/app_bar.dart';
import 'package:routing/widgets/arrow_icon.dart';
import 'package:routing/widgets/horizonatl_travel_dots.dart';
import 'package:routing/widgets/page_indicator.dart';
import 'package:routing/widgets/share_button.dart';
import 'dart:math' as math;
import 'leopard/leopard_image.dart';
import 'leopard/leopard_page.dart';
import 'vulture/base_time_label.dart';
import 'vulture/map_button.dart';
import 'vulture/start_camp_label.dart';
import 'vulture/start_time_label.dart';
import 'vulture/travel_label_deatils.dart';
import 'vulture/vulture_image.dart';
import 'vulture/vulture_page.dart';

class PageOffsetNotifier with ChangeNotifier {
  double _offset = 0;
  double _page = 0;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _offset = pageController.offset;
      _page = pageController.page;
      notifyListeners();
    });
  }

  double get offset => _offset;

  double get page => _page;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final PageController _pageController = PageController();

  double get maxHeight => MediaQuery.of(context).size.height;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => PageOffsetNotifier(_pageController),
      child: ListenableProvider.value(
        value: _animationController,
        child: Scaffold(
          body: GestureDetector(
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            child: SafeArea(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  PageView(
                    controller: _pageController,
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      LeopardPage(),
                      VulturePage(),
                    ],
                  ),
                  Appbar(),
                  LeopardImage(),
                  VultureImage(),
                  ShareButton(),
                  PageIndicator(),
                  ArrowIcon(),
                  TravelDetailsLabel(),
                  StartCampLabel(),
                  StartTimeLabel(),
                  BaseCampLabel(),
                  BaseTimeLabel(),
                  DistanceLabel(),
                  HorizontalTravelDots(),
                  MapButton(),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _animationController.value -= details.primaryDelta / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_animationController.isAnimating ||
        _animationController.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0)
      _animationController.fling(velocity: math.max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      _animationController.fling(velocity: math.min(-2.0, -flingVelocity));
    else
      _animationController.fling(
          velocity: _animationController.value < 0.5 ? -2.0 : 2.0);
  }
}
