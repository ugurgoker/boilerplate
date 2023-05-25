import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/request/model_request_login.dart';
import '../models/response/model_response_login.dart';

part 'api_client.g.dart';

@RestApi(parser: Parser.DartJsonMapper)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST('/Auth/SignIn')
  Future<ModelResponseLogin> login(@Body() ModelRequestLogin body);
}