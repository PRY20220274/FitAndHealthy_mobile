import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  final List<String> _pages = [
    'goals',
    'suggestions',
    'home',
    'activities',
  ];

  late int _currentPos;
  late String _currentPage;
  late PageController _pageController;

  NavigationProvider() {
    _currentPos = 0;
    _currentPage = _pages[0];
    _pageController = PageController(initialPage: 0);
  }

  PageController get pageController => _pageController;
  String get currentPage => _currentPage;
  int get currentPos => _currentPos;

  set currentPos(int value) {
    final diff = (_currentPos - value).abs();

    _currentPos = value;
    _currentPage = _pages[value];

    if (diff > 1) {
      _pageController.jumpToPage(value);
    } else {
      _pageController.animateToPage(
        value,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }

    notifyListeners();
  }

  moveTo(int value) {
    _currentPos = value;
    _currentPage = _pages[value];
    _pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );

    notifyListeners();
  }

  setWithoutMove(int value) {
    _currentPos = value;
    _currentPage = _pages[value];
    _pageController.dispose();
    _pageController = PageController(initialPage: value);

    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
