import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../ui/widgets/activity_indicator.dart';
import '../../core/enums/enum_app.dart';
import '../../core/utils/utilities.dart';

import 'base_view_model.dart';

class WidgetBase<T extends ViewModelBase> extends StatelessWidget {
  final Widget Function(BuildContext context, T value, Widget? child)? builder;
  final SystemUiOverlayStyle? statusbarBrightness;
  final T model;
  final Widget? child;
  final bool? isActiveLoadingIndicator;

  const WidgetBase({Key? key, this.builder, required this.model, this.statusbarBrightness, this.child, this.isActiveLoadingIndicator = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: statusbarBrightness ?? SystemUiOverlayStyle.dark,
      child: GestureDetector(
        onTap: () => Utilities.hideKeyboard(context),
        child: child ?? ChangeNotifierProvider<T>(
          create: (context) => model,
          builder: (context, child) => 
            isActiveLoadingIndicator! ? Consumer<T>(builder: (context, viewModel, child) {
              return Stack(
                children: [
                  builder!(context, viewModel, child),
                  viewModel.activityState == ActivityState.isLoading ? const ActivityIndicator() : Container(),
                ],
              );
            },
          ) : Consumer<T>(builder: (context, viewModel, child) => builder!(context, viewModel, child)),
        ),
      ),
    );
  }
}
