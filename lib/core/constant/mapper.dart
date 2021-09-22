import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, JsonMapperAdapter, typeOf;
import '../../core/models/model_corporation.dart';
import '../../core/models/model_login.dart';
import '../../core/models/model_login_response.dart';
import '../../core/models/response_data.dart';

class JsonMapperContext {
  
  JsonMapperContext() {
    JsonMapper().useAdapter(JsonMapperAdapter(valueDecorators: {
      typeOf<List<ModelCorporation>>(): (value) => value.cast<ModelCorporation>(),
      typeOf<Set<ModelCorporation>>(): (value) => value.cast<ModelCorporation>(),
      typeOf<List<ModelLoginResponse>>(): (value) => value.cast<ModelLoginResponse>(),
      typeOf<Set<ModelLoginResponse>>(): (value) => value.cast<ModelLoginResponse>(),
      typeOf<List<ModelLogin>>(): (value) => value.cast<ModelLogin>(),
      typeOf<Set<ModelLogin>>(): (value) => value.cast<ModelLogin>(),
      typeOf<List<ResponseData>>(): (value) => value.cast<ResponseData>(),
      typeOf<Set<ResponseData>>(): (value) => value.cast<ResponseData>(),
    }));
  }
}
