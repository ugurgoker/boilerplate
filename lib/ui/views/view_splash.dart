import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fora/ui/widgets/widgets_text.dart';
import '/core/constant/ui_brightness_style.dart';
import '/ui/animations/splash_transition.dart';
import '/ui/vms/view_model_splash.dart';
import '../../core/resources/_r.dart';
import '../../ui/base/base_view.dart';

class ViewSplash extends StatelessWidget {
  const ViewSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetBase<ViewModelSplash>(
      statusbarBrightness: UIBrightnessStyle.getInstance().light(systemNavigationBarColor: R.color.midnight),
      model: ViewModelSplash(context),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: R.color.midnight,
        body: _getBody(context, viewModel),
      ),
    );
  }

  Widget _getBody(BuildContext context, ViewModelSplash viewModel) {
    return TransitionSplash(
      child: FadeInLeft(
        child: const TextBasic(text: 'Splash')
      ),
      onFinish: () => viewModel.onFinishAnimation(),
    );
  }
}
