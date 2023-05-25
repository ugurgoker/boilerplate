import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../constants/ui_brightness_style.dart';
import 'router.dart';
import 'router.gr.dart';

class ServiceRoute extends ChangeNotifier {
  final UIBrightnessStyle uiBrightnessStyle = UIBrightnessStyle();

  late GlobalKey<NavigatorState> navigatorKey;
  static late RootRouter rootRouter;
  static late AutoRouterDelegate routerDelegate;

  ServiceRoute() {
    navigatorKey = GlobalKey<NavigatorState>();
    rootRouter = RootRouter(navigatorKey);
    routerDelegate = AutoRouterDelegate(rootRouter, navigatorObservers: () => [RooterObserver()]);
  }

  void onBackPressed<T extends Object?>([T? result, ChangeNotifier? viewModel]) {
    rootRouter.pop(result);
  }

  Future<T?> startNewView<T>({required PageRouteInfo<dynamic> route, bool isReplace = false, bool clearStack = false}) async {
    if (isReplace && clearStack) {
      await rootRouter.replaceAll([route]);
    } else if (isReplace) {
      return await rootRouter.replace<T>(route);
    } else {
      return await rootRouter.push<T>(route);
    }
    return null;
  }

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}