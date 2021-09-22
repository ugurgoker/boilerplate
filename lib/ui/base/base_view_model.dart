import 'package:flutter/material.dart';
import '../../core/enums/enum_app.dart';

abstract class ViewModelBase extends ChangeNotifier {
  late BuildContext context;
  ActivityState activityState = ActivityState.isLoaded;

  void setActivityState(ActivityState state) {
    activityState = state;
    notifyListeners();
  }
}