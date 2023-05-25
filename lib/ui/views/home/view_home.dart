import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../ui/views/home/vm_home.dart';
import '../../../core/constants/ui_brightness_style.dart';
import '../../../core/resources/_r.dart';
import '../../../ui/base/base_view.dart';
import '../../../ui/widgets/widgets_text.dart';

class ViewHome extends WidgetBase<VmHome> {
  const ViewHome({
    super.key,
    super.isActiveLoadingIndicator = true,
  });

  @override
  SystemUiOverlayStyle systemBarBrightness() => UIBrightnessStyle.dark(systemNavigationBarColor: R.color.white);

  @override
  VmHome createViewModel(BuildContext context) => VmHome();

  @override
  Widget buildWidget(BuildContext context, VmHome viewModel) {
    return Scaffold(body: _getBody(context, viewModel));
  }

  Widget _getBody(BuildContext context, VmHome viewModel) {
    return GestureDetector(
      onTap: () => viewModel.logout(),
      child: const Center(child: TextBasic(text: 'home')),
    );
  }
}
