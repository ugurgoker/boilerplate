import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../ui/views/view_splash.dart';
import '../../ui/views/view_login.dart';

export 'service_route.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(path: '/splash', page: ViewSplash),
    CustomRoute<String>(path: '/login/:id', page: ViewLogin, transitionsBuilder: TransitionsBuilders.slideBottom),

    RedirectRoute(path: '*', redirectTo: '/splash'),
  ],
)
class $RootRouter {}

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log('didPush: ${route.isActive.toString()}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log('didPop: ${route.isActive.toString()} ${previousRoute!.isActive.toString()}');
  }

}
