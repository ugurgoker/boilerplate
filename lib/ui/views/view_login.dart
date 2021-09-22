import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../ui/vms/view_model_login.dart';
import '../../core/resources/_r.dart';
import '../../ui/base/base_view.dart';

class ViewLogin extends StatelessWidget {
  final String id;

  const ViewLogin({
    Key? key,
    @PathParam('id') this.id = 'id',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetBase<ViewModelLogin>(
      statusbarBrightness: SystemUiOverlayStyle.dark,
      model: ViewModelLogin(context),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: R.color.white,
        body: _getBody(context, viewModel),
      ),
    );
  }

  Widget _getBody(BuildContext context, ViewModelLogin viewModel) {
    return Center(
      child: Text(
        'login',
        style: TextStyle(
          color: R.color.black,
        ),
      ),
    );
  }
}
