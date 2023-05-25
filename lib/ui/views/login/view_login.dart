import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/services/router.gr.dart';
import '../../../ui/widgets/widgets_text.dart';
import '../../../core/constants/ui_brightness_style.dart';
import '../../../core/resources/_r.dart';
import '../../../ui/base/base_view.dart';

import 'vm_login.dart';

class ViewLogin extends WidgetBase<VmLogin> {
  const ViewLogin({
    super.key,
    super.isActiveLoadingIndicator = true,
  });

  @override
  SystemUiOverlayStyle systemBarBrightness() => UIBrightnessStyle.dark(systemNavigationBarColor: R.color.white);

  @override
  VmLogin createViewModel(BuildContext context) => VmLogin(apiService(context), firebaseService(context));

  @override
  Widget buildWidget(BuildContext context, VmLogin viewModel) {
    return Scaffold(body: _getBody(context, viewModel));
  }

  Widget _getBody(BuildContext context, VmLogin viewModel) {
    return GestureDetector(
      onTap: () async {
        var state = await viewModel.login('username', 'password');
        if (state && context.mounted) {
          router(context).startNewView(route: ViewHomeRoute(), isReplace: true, clearStack: true);
        }
      },
      child: const Center(child: TextBasic(text: 'login')),
    );
  }
}
