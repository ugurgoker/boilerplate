import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_config.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import '../../core/enums/enum_app.dart';
import '../../core/resources/_r.dart';

abstract class ViewModelBase extends ChangeNotifier {
  ActivityState activityState = ActivityState.isLoaded;
  ErrorProperty errorObserver = ErrorProperty();

  void setActivityState(ActivityState state, [String errMsg = '']) {
    activityState = state;
    if (state == ActivityState.isLoading || state == ActivityState.isLoaded) {
      errMsg = '';
    } else {
      errorObserver.message = errMsg;
    }
    notifyListeners();
  }

  bool isLoading() {
    return activityState == ActivityState.isLoading;
  }

  bool isError() {
    return activityState == ActivityState.isError;
  }

  Future<void> handleApiError(dynamic error) async {
    activityState = ActivityState.isError;
    if (error is DioError) {
      errorObserver.message = error.message ?? '';
      if (error.response != null) {
        switch (error.response!.statusCode) {
          case 401:
            logout();
            break;
          default:
        }
      }
    } else {
      errorObserver.message = R.string.genericError;
    }
    notifyListeners();
  }

  void logout([bool isDirectLogout = false]) {
    errorObserver.activityErrorActionState = isDirectLogout ? ActivityErrorActionState.directLogout : ActivityErrorActionState.logout;
  }
}

class ErrorProperty extends PropertyChangeNotifier<String> {
  String _message = '';
  String get message => _message;

  ActivityErrorActionState _activityErrorActionState = ActivityErrorActionState.none;
  ActivityErrorActionState get activityErrorActionState => _activityErrorActionState;

  set message(String value) {
    _message = value;
    notifyListeners(errorPropertyMessageTag);
  }

  set activityErrorActionState(ActivityErrorActionState value) {
    _activityErrorActionState = value;
    notifyListeners(errorPropertyActivityActionStateTag);
  }
}
