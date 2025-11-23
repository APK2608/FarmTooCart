import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../home_screen/home_screen.dart';
import './bloc/shopping_cart_bloc.dart';
import './models/shopping_cart_model.dart';
import './shopping_cart_initial_page.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ShoppingCartBloc>(
      create: (context) => ShoppingCartBloc(ShoppingCartState(
        shoppingCartModelObj: ShoppingCartModel(),
      ))
        ..add(ShoppingCartInitialEvent()),
      child: ShoppingCartScreen(),
    );
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.shoppingCartScreenInitialPage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, a1, a2) =>
                getCurrentPage(context, routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.maxFinite,
          child: _buildBottomNavigation(context),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return CustomBottomBar(
      bottomBarItemList: [
        CustomBottomBarItem(
          icon: ImageConstant.imgMaterialsymbolshomerounded,
          activeIcon: ImageConstant.imgMaterialsymbolshomerounded,
          routeName: AppRoutes.homeScreen,
        ),
        CustomBottomBarItem(
          icon: ImageConstant.imgMingcutebookmarkfill,
          routeName: '/bookmark',
        ),
        CustomBottomBarItem(
          icon: ImageConstant.imgNavMyCart,
          routeName: AppRoutes.shoppingCartScreen,
        ),
        CustomBottomBarItem(
          icon: ImageConstant.imgIcroundaccountcircle,
          routeName: '/profile',
        ),
      ],
      onChanged: (index) {
        var bottomBarItemList = [
          AppRoutes.homeScreen,
          '/bookmark',
          AppRoutes.shoppingCartScreen,
          '/profile',
        ];
        navigatorKey.currentState?.pushNamed(bottomBarItemList[index]);
      },
      selectedIndex: 2,
    );
  }

  Widget getCurrentPage(BuildContext context, String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.shoppingCartScreenInitialPage:
        return ShoppingCartInitialPage.builder(context);
      case AppRoutes.homeScreen:
        return HomeScreen.builder(context);
      default:
        return ShoppingCartInitialPage.builder(context);
    }
  }
}
