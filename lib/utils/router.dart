import 'package:flutter/material.dart';
import 'package:testing/feature/view/fruit_view.dart';

extension RouteableWidget on Widget {
  WidgetBuilder asBuilder() {
    return (_) => this;
  }
}

extension RouteableWidgetBuilder on WidgetBuilder {
  Route<dynamic> asRoute<T>(RouteSettings settings) {
    return MaterialPageRoute<T>(builder: this, settings: settings);
  }
}

class AppRouter {
  AppRouter._();

  static const String initialRoute = FruitView.routeName;

  static WidgetBuilder navigate(RouteSettings settings) {
    final String? path = settings.name;

    final Object? args = settings.arguments;

    if (path == null) {
      return const Text('Route Error').asBuilder();
    }

    if (path == FruitView.routeName) {
      return const FruitView().asBuilder();
    }

    return const Center(child: Text('Route Error')).asBuilder();
  }
}
