import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/resources/_r.dart';
import '../../ui/base/base_view.dart';
import '../../ui/vms/view_model_splash.dart';

class ViewSplash extends StatelessWidget {
  const ViewSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetBase<ViewModelSplash>(
      statusbarBrightness: SystemUiOverlayStyle.dark,
      model: ViewModelSplash(context),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: R.color.white,
        body: _getBody(context, viewModel),
      ),
    );
  }

  Widget _getBody(BuildContext context, ViewModelSplash viewModel) {
    return Center(
      child: Text(
        'splash',
        style: TextStyle(
          color: R.color.black,
        ),
      ),
    );
  }
}
