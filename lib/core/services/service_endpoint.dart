import 'package:http/http.dart';
import '/core/enums/enum_app.dart';
import '/core/models/model_login.dart';

class ServiceEndpoint {
  static ServiceEndpoint? _instance;
  static ServiceEndpoint getInstance() => _instance ??= ServiceEndpoint();

  //#region AUTH API 
  ApiRequestModel login({required ModelLogin model}) => ApiRequestModel(id: 1, apiMethod: ApiMethod.post, endpoint: 'Auth/login', body: model);
  //#endregion
}

class ApiRequestModel {
  final int id;
  final ApiMethod apiMethod;
  final String endpoint;
  final dynamic body;
  final Map<String, String>? header;
  final List<MultipartFile>? multipartFiles;

  ApiRequestModel({required this.id, required this.apiMethod, required this.endpoint, this.body, this.header, this.multipartFiles});

}