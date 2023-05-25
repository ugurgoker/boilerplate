import 'dart:developer';
import 'package:jwt_decode/jwt_decode.dart';

import '../../../core/services/service_firebase.dart';
import '../../../core/utils/general_data.dart';
import '../../../core/utils/utilities.dart';
import '../../../ui/base/base_view_model.dart';

class VmSplash extends ViewModelBase {
  final ServiceFirebase serviceFirebase;

  VmSplash(this.serviceFirebase);

  Future<bool> handleToken() async {
    String? authToken = GeneralData.getInstance().getAuthToken();
    log(authToken.toString(), name: 'AUTH TOKEN');
    bool state = false;
    if (authToken != null) {
      if (!Jwt.isExpired(authToken)) {
        var modelToken = await Utilities.parseToken(serviceFirebase, authToken);
        if (modelToken != null) {
          GeneralData.getInstance().userData = modelToken;
          state = true;
        } else {
          GeneralData.getInstance().setAuthToken(null);
        }
      }
    } else {
      GeneralData.getInstance().setAuthToken(null);
    }
    return state;
  }
}
