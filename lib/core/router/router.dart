// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:pokemonn/view/home_page.dart';

class RouteGenerator {
  static final RouteGenerator _generator = RouteGenerator._init();

  static RouteGenerator get router => _generator;

  RouteGenerator._init();

  Route<dynamic>? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _navigate(const HomePage());
    }
  }

  MaterialPageRoute _navigate(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }
}
