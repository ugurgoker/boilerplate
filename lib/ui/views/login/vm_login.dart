import '../../../core/resources/_r.dart';
import '../../../core/services/service_api.dart';
import '../../../core/services/service_firebase.dart';
import '../../../core/utils/general_data.dart';
import '../../../core/utils/utilities.dart';

import '../../../core/models/request/model_request_login.dart';
import '../../base/base_view_model.dart';

class VmLogin extends ViewModelBase {
  final ServiceApi serviceApi;
  final ServiceFirebase serviceFirebase;

  VmLogin(this.serviceApi, this.serviceFirebase);

  Future<bool> login(String email, String password) async {
    bool state = false;
    ModelRequestLogin body = ModelRequestLogin(email: email, password: password);
    await serviceApi.client.login(body).then(
      (response) async {
        var modelToken = await Utilities.parseToken(serviceFirebase, response.data?.token);
        if (modelToken != null) {
          GeneralData.getInstance().userData = modelToken;
          GeneralData.getInstance().setUsername(email);
          GeneralData.getInstance().setAuthToken(response.data!.token);
          state = true;
        } else {
          errorObserver.message = R.string.genericError;
        }
      },
      onError: (error) {
        handleApiError(error);
      },
    );
    return state;
  }
}
