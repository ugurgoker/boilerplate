import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/services/router.gr.dart';
import '../../../core/utils/alert_utils.dart';
import '../../../core/constants/ui_brightness_style.dart';
import '../../../core/models/model_alert_dialog.dart';
import '../../../core/resources/_r.dart';
import '../../../core/services/service_device_info.dart';
import '../../../core/utils/utilities.dart';
import '../../../ui/base/base_view.dart';
import '../../../ui/views/splash/vm_splash.dart';
import '../../../ui/widgets/widgets_text.dart';
import '../../animations/splash_transition.dart';

class ViewSplash extends WidgetBase<VmSplash> {
  const ViewSplash({
    super.key,
    super.isActiveLoadingIndicator = true,
  });

  @override
  SystemUiOverlayStyle systemBarBrightness() => UIBrightnessStyle.dark(systemNavigationBarColor: R.color.white);

  @override
  VmSplash createViewModel(BuildContext context) {
    di<ServiceDeviceInfo>(context);
    return VmSplash(firebaseService(context));
  }

  @override
  Widget buildWidget(BuildContext context, VmSplash viewModel) {
    return Scaffold(body: _getBody(context, viewModel));
  }

  Widget _getBody(BuildContext context, VmSplash viewModel) {
    return Container(
      color: R.themeColor.primary,
      child: TransitionSplash(
        child: FadeInLeft(
          child: TextBasic(text: R.string.appName, color: R.color.black),
        ),
        onFinish: () async {
          var serviceFirebase = viewModel.serviceFirebase;
          var serviceDeviceInfo = di<ServiceDeviceInfo>(context);
          var version = await serviceFirebase.getVersionCode();
          var isUpdateRequired = await serviceFirebase.getIsUpdateRequired();
          if (context.mounted) {
            if (serviceDeviceInfo.buildNumber < version) {
              if (isUpdateRequired) {
                AlertUtils.showPlatformAlert(
                  context,
                  ModelAlertDialog(
                    description: R.string.pleaseUpdateApp,
                    isDismissible: false,
                    onPressedButton: () {
                      Utilities.openStore();
                      exit(0);
                    },
                  ),
                );
                return;
              } else {
                AlertUtils.showToast(R.string.versionCheckMessage((version - serviceDeviceInfo.buildNumber).toString()));
              }
            }
            if (await viewModel.handleToken()) {
              if (context.mounted) {
                router(context).startNewView(route: ViewHomeRoute(), isReplace: true, clearStack: true);
              }
            } else {
              if (context.mounted) {
                router(context).startNewView(route: ViewLoginRoute(), isReplace: true, clearStack: true);
              }
            }
          }
        },
      ),
    );
  }
}
