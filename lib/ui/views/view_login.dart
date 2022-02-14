import 'package:flutter/material.dart';
import '/core/constant/ui_brightness_style.dart';
import '/ui/widgets/widgets_text.dart';
import '../../ui/vms/view_model_login.dart';
import '../../core/resources/_r.dart';
import '../../ui/base/base_view.dart';

class ViewLogin extends StatelessWidget {
  const ViewLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetBase<ViewModelLogin>(
      statusbarBrightness: UIBrightnessStyle.getInstance().dark(
          systemNavigationBarColor: R.color.grayLightIce),
      model: ViewModelLogin(context),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: R.color.grayLightIce,
        body: _getBody(context, viewModel),
      ),
    );
  }

  Widget _getBody(BuildContext context, ViewModelLogin viewModel) {
    return const Center(child: TextBasic(text: 'login'));
  }
}
