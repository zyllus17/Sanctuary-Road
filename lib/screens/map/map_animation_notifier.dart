import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../home_page.dart';

class MapAnimationNotifier with ChangeNotifier {
  final AnimationController _animationController;

  MapAnimationNotifier(this._animationController) {
    _animationController.addListener(_onAnimationControllerChanged);
  }

  double get value => _animationController.value;

  void forward() => _animationController.forward();

  void _onAnimationControllerChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _animationController.removeListener(_onAnimationControllerChanged);
    super.dispose();
  }
}

double startTop(context) =>
    topMargin(context) + mainSquareSize(context) + 32 + 16 + 32 + 4;

double endTop(context) => topMargin(context) + 32 + 16 + 8;

double oneThird(context) => (startTop(context) - endTop(context)) / 3;

double topMargin(BuildContext context) =>
    MediaQuery.of(context).size.height > 700 ? 128 : 64;

double mainSquareSize(BuildContext context) =>
    MediaQuery.of(context).size.height / 2;

double dotsTopMargin(BuildContext context) =>
    topMargin(context) + mainSquareSize(context) + 32 + 16 + 32 + 4;

double bottom(BuildContext context) =>
    MediaQuery.of(context).size.height - dotsTopMargin(context) - 8;

EdgeInsets mediaPadding;

class MapButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 8,
      bottom: 0,
      child: Consumer<PageOffsetNotifier>(
        builder: (context, notifier, child) {
          double opacity = math.max(0, 4 * notifier.page - 3);
          return Opacity(
            opacity: opacity,
            child: child,
          );
        },
        child: FlatButton(
          child: Text(
            'ON MAP',
            style: TextStyle(fontSize: 12),
          ),
          onPressed: () {
            final notifier = Provider.of<MapAnimationNotifier>(context);
            notifier.value == 0
                ? notifier.forward()
                : notifier._animationController.reverse();
          },
        ),
      ),
    );
  }
}