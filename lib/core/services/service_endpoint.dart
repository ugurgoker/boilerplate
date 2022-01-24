import 'package:http/http.dart';
import '../enums/enum_app.dart';
import '../models/model_login.dart';

class ServiceEndpoint {
  static ServiceEndpoint? _instance;
  static ServiceEndpoint getInstance() => _instance ??= ServiceEndpoint();

  ApiRequestModel login({required ModelLogin model}) => ApiRequestModel(apiMethod: ApiMethod.post, endpoint: 'Auth/login', body: model);
}

class ApiRequestModel {
  final ApiMethod apiMethod;
  final String endpoint;
  final dynamic body;
  final Map<String, String>? header;
  final List<MultipartFile>? multipartFiles;

  ApiRequestModel({required this.apiMethod, required this.endpoint, this.body, this.header, this.multipartFiles});

}