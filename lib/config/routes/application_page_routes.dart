import 'package:flutter/material.dart';
import 'package:food_delivery/bottom_bar_content/food_details/screen/food_details_screen.dart';
import 'package:food_delivery/demo_screens/cart_screen.dart';
import 'package:food_delivery/utility/loading_indicator.dart';

class ScreenRouter {
  ScreenRouter();

  Route onGeneratedRouter(RouteSettings routeSettings) {
    String? routeName = routeSettings.name;

    switch (routeName) {
      case FoodDetailsScreen.routeName:
        return MaterialPageRoute(
          settings: RouteSettings(arguments: routeSettings.arguments),
          builder: (_) => const FoodDetailsScreen(),
        );

      case CartScreen.routeName:
        return MaterialPageRoute(
          settings: RouteSettings(arguments: routeSettings.arguments),
          builder: (_) => const CartScreen(),
        );

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
