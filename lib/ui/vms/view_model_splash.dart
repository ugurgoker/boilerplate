import 'dart:async';
import 'package:flutter/material.dart';
import '/core/utils/utilities.dart';
import '../../core/services/service_route.dart';
import '../../core/settings/controller_theme.dart';
import '../../ui/base/base_view_model.dart';

class ViewModelSplash extends ViewModelBase {

  ViewModelSplash(BuildContext context) {
    this.context = context;
    ThemeController.getInstance().getTheme();
    init();
  }

  Future<void> init() async {
    // ModelLogin model = ModelLogin(userName: '5386277351', password: 'Ds102278.!');
    // ResponseData<ModelLoginResponse> response = await ServiceApi.apiRequest(context, apiRequest: ServiceEndpoint.login(model: model));
    // if (response.isSuccess) {
    //   GeneralData.getInstance().rootRouter.replace(ViewLoginRoute(id: response.result!.id!));
    // } else {
    //   Utilities.alerts.showPlatformAlert(context, ModelAlertDialog(description: response.message!));
    // }
  }

  void onFinishAnimation() {
    Utilities.startNewView(context, route: const ViewLoginRoute(), isReplace: true, clearStack: true);
  }
}
