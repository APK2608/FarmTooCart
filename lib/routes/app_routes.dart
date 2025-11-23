import 'package:flutter/material.dart';
import '../presentation/shopping_cart_screen/shopping_cart_screen.dart';
import '../presentation/home_screen/home_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String shoppingCartScreen = '/shopping_cart_screen';
  static const String shoppingCartScreenInitialPage =
      '/shopping_cart_screen_initial_page';
  static const String homeScreen = '/home_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
        shoppingCartScreen: ShoppingCartScreen.builder,
        homeScreen: HomeScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: AppNavigationScreen.builder
      };
}
