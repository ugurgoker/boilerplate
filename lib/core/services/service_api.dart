import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import '../../core/models/model_corporation.dart';
import '../../core/models/model_login.dart';
import '../../core/models/model_login_response.dart';
import '../../core/models/response_data.dart';

part 'service_api.g.dart';

@RestApi(baseUrl: '')
abstract class ServiceApi {
  factory ServiceApi(Dio dio, {String baseUrl}) = _ServiceApi;

  @POST('Auth/login')
  Future<ResponseData<ModelLoginResponse>> login(@Body() ModelLogin model);

  @GET('Corporation')
  Future<ResponseData<List<ModelCorporation>>> getCorporations(@Header('Authorization') String token);
}