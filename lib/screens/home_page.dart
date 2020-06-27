import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'leopard_page.dart';
import 'vulture_page.dart';

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

class HomePage extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => PageOffsetNotifier(_pageController),
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                LeopardPage(),
                VulturePage(),
              ],
            ),
            LeopardImage(),
          ],
        ),
      ),
    );
  }
}
