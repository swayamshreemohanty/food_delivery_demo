import 'package:flutter/material.dart';
import 'package:food_delivery/utility/loading_indicator.dart';

class ScreenRouter {
  ScreenRouter();

  Route onGeneratedRouter(RouteSettings routeSettings) {
    String? routeName = routeSettings.name;

    switch (routeName) {
      // case ContactCenterScreen.routeName:
      //   return MaterialPageRoute(
      //     settings: RouteSettings(arguments: routeSettings.arguments),
      //     builder: (_) => const ContactCenterScreen(),
      //   );
      //


      default:
        return errorRoute();
    }
  }

  static Route errorRoute() => MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => const Scaffold(
          body: Center(
            child: LoadingIndicator(
              color: Colors.red,
              strokeWidth: 5,
            ),
          ),
        ),
      );
}
