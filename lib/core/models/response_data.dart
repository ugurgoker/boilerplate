import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, jsonSerializable;
import 'package:http/http.dart';

import '../resources/_r.dart';

@jsonSerializable
class ResponseData<T> {
  bool isSuccess;
  final int totalCount;
  String? code;
  String message;
  int? statusCode;
  T? result;
  Response? response;

  ResponseData({required this.isSuccess, this.totalCount = 0, this.code, required this.message, this.result, this.response});


  factory ResponseData.fromJson(Map<String, dynamic> json, Response response) {
    return ResponseData<T>(
      isSuccess: json['isSuccess'] ?? false,
      totalCount: json['totalCount'] ?? 0,
      code: json['code'],
      message: json['message'] ?? R.string.genericError, 
      result: JsonMapper.deserialize<T>(json['result']),
      response: response,
    );
  }

  
  Map<String, dynamic> toJson() => JsonMapper.serialize(this) as Map<String, dynamic>;
}