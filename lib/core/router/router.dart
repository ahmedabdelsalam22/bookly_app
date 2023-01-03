import 'package:bookly/presentation_layer/view/book_details_view/book_details_view.dart';
import 'package:bookly/presentation_layer/view/home_view/home_view.dart';
import 'package:flutter/material.dart';

import '../../presentation_layer/view/splash_view/splash_screen.dart';

class Routes {
  static const String kSplashViewRoute = 'splashView';
  static const String kHomeViewRoute = 'homeView';
  static const String kBookDetailsViewRoute = 'bookDetailsView';
}

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kHomeViewRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.kBookDetailsViewRoute:
        return MaterialPageRoute(builder: (_) => const BookDetailsView());

      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
