import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, jsonSerializable;

@jsonSerializable
class ResponseData<T> {
  final int? responseDataType;
  final int? totalRowCount;
  final String code;
  final String message;
  final DateTime? serverTime;
  T? result;

  ResponseData({this.responseDataType, this.totalRowCount, required this.code, required this.message, this.serverTime, this.result});


  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData<T>(
      responseDataType: json['responseDataType'],
      totalRowCount: json['totalRowCount'],
      code: json['code'],
      message: json['message'],
      serverTime: DateTime.parse(json['serverTime']),
      result: JsonMapper.deserialize<T>(json['result']),
    );
  }

  
  Map<String, dynamic> toJson() => JsonMapper.serialize(this) as Map<String, dynamic>;
}