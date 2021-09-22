import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, jsonSerializable;

@jsonSerializable
class ModelLogin {
  String? userName;
  String? password;
  String? deviceId;
  String? language;

  ModelLogin({this.userName, this.password, this.deviceId, this.language});

  factory ModelLogin.fromJson(Map<String, dynamic> json) => JsonMapper.deserialize<ModelLogin>(jsonEncode(json)) as ModelLogin;
  Map<String, dynamic> toJson() => jsonDecode(JsonMapper.serialize(this));
}
