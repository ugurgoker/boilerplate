import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/services/service_route.dart';
import '../../core/utils/general_data.dart';
import '../../core/settings/controller_theme.dart';
import '../../ui/base/base_view_model.dart';

class ViewModelSplash extends ViewModelBase {

  ViewModelSplash(BuildContext context) {
    this.context = context;
    ThemeController.getInstance().getTheme();
    init();
  }

  Future<void> init() async {
    Future.delayed(Duration(seconds: 3), () => GeneralData.rootRouter.replace(ViewLoginRoute(id: 'ucg')));
  }
}
