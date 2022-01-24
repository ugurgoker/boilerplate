import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, jsonSerializable;

@jsonSerializable
class ResponseData<T> {
  bool isSuccess;
  final int? totalRowCount;
  String? code;
  String? message;
  final DateTime? serverTime;
  int? statusCode;
  T? result;

  ResponseData({required this.isSuccess, this.totalRowCount, this.code, this.message, this.serverTime, this.result});


  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData<T>(
      isSuccess: json['responseDataType'] == 1,
      totalRowCount: json['totalRowCount'],
      code: json['code'],
      message: json['message'],
      serverTime: DateTime.parse(json['serverTime']),
      result: JsonMapper.deserialize<T>(json['result']),
    );
  }

  
  Map<String, dynamic> toJson() => JsonMapper.serialize(this) as Map<String, dynamic>;
}