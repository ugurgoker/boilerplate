import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, JsonMapperAdapter, typeOf;
import '/core/models/model_alert_dialog.dart';
import '../models/model_login.dart';
import '../models/model_login_response.dart';
import '../models/response_data.dart';

class ServiceJsonMapperContext {
  
  ServiceJsonMapperContext() {
    JsonMapper().useAdapter(JsonMapperAdapter(valueDecorators: {
      
      typeOf<List<ModelAlertDialog>>(): (value) => value.cast<ModelAlertDialog>(),
      typeOf<Set<ModelAlertDialog>>(): (value) => value.cast<ModelAlertDialog>(),
      
      typeOf<List<ResponseData>>(): (value) => value.cast<ResponseData>(),
      typeOf<Set<ResponseData>>(): (value) => value.cast<ResponseData>(),
      
      typeOf<List<ModelLogin>>(): (value) => value.cast<ModelLogin>(),
      typeOf<Set<ModelLogin>>(): (value) => value.cast<ModelLogin>(),
      
      typeOf<List<ModelLoginResponse>>(): (value) => value.cast<ModelLoginResponse>(),
      typeOf<Set<ModelLoginResponse>>(): (value) => value.cast<ModelLoginResponse>(),
    }));
  }
}
