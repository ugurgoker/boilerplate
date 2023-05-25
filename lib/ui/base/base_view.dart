import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/resources/_r.dart';
import '../../core/services/router.gr.dart';
import '../../core/utils/general_data.dart';
import '../../core/services/service_app.dart';
import '../../core/constants/app_config.dart';
import '../../core/services/service_firebase.dart';
import '../../core/utils/alert_utils.dart';
import 'package:provider/provider.dart';
import '../../core/enums/enum_app.dart';
import '../../core/models/model_alert_dialog.dart';
import '../../core/services/service_api.dart';
import '../../core/services/service_route.dart';
import '../widgets/activity_indicator.dart';
import 'base_view_model.dart';

abstract class WidgetBase<T extends ViewModelBase> extends StatelessWidget with BaseView {
  final Widget Function(BuildContext context, T value)? builder;
  final bool? isActiveLoadingIndicator;

  const WidgetBase({
    super.key,
    this.builder,
    this.isActiveLoadingIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    di<ServiceApp>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemBarBrightness() ?? SystemUiOverlayStyle.dark,
      child: ChangeNotifierProvider<T>(
        create: (context) => createViewModel(context),
        builder: (context, child) {
          return Consumer<T>(
            builder: (context, viewModel, child) {
              initListener(context, viewModel);
              return Stack(
                children: [
                  buildWidget(context, viewModel),
                  viewModel.activityState == ActivityState.isLoading ? const ActivityIndicator() : Container(),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget buildWidget(BuildContext context, T viewModel);
  T createViewModel(BuildContext context);
  SystemUiOverlayStyle? systemBarBrightness();
}

mixin BaseView {
  Size size(BuildContext context) => MediaQuery.of(context).size;
  EdgeInsets systemPadding(BuildContext context) => MediaQuery.of(context).padding;
  EdgeInsets viewInsets(BuildContext context) => MediaQuery.of(context).viewInsets;
  bool keyboardVisibility(BuildContext context) => MediaQuery.of(context).viewInsets.bottom > 0;

  ServiceRoute router(context, [bool listen = false]) => Provider.of<ServiceRoute>(context, listen: listen);
  ServiceApi apiService(context, [bool listen = false]) => Provider.of<ServiceApi>(context, listen: listen);
  ServiceFirebase firebaseService(context, [bool listen = false]) => Provider.of<ServiceFirebase>(context, listen: listen);

  void requestFocus(context, focusNode) => FocusScope.of(context).requestFocus(focusNode);

  T di<T>(BuildContext context, {bool listen = false}) => Provider.of<T>(context, listen: listen);

  void initListener(BuildContext context, ViewModelBase viewModel) {
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    if (!viewModel.errorObserver.hasListeners) {
      viewModel.errorObserver.addListener((String? property) {
        if (property == errorPropertyMessageTag && viewModel.errorObserver.message.isNotEmpty) {
          AlertUtils.showPlatformAlert(context, ModelAlertDialog(description: viewModel.errorObserver.message));
          viewModel.errorObserver.message = '';
        }
        if (property == errorPropertyActivityActionStateTag && viewModel.errorObserver.activityErrorActionState != ActivityErrorActionState.none) {
          if (viewModel.errorObserver.activityErrorActionState == ActivityErrorActionState.logout) {
            AlertUtils.showPlatformAlert(
              context,
              ModelAlertDialog(
                description: R.string.logoutConfirmation,
                isActiveCancelButton: true,
                onPressedButton: () => _logout(context),
              ),
            );
          } else if (viewModel.errorObserver.activityErrorActionState == ActivityErrorActionState.directLogout) {
            _logout(context);
          }
          viewModel.errorObserver.activityErrorActionState = ActivityErrorActionState.none;
        }
      }, [errorPropertyMessageTag, errorPropertyActivityActionStateTag]);
    }
  }

  void _logout(BuildContext context) {
    GeneralData.getInstance().userData = null;
    GeneralData.getInstance().setAuthToken(null);
    GeneralData.getInstance().setUsername(null);
    router(context).startNewView(route: ViewLoginRoute(), isReplace: true, clearStack: true);
  }
}
