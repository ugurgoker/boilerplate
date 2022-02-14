import 'package:dart_json_mapper/dart_json_mapper.dart' show jsonSerializable;

@jsonSerializable
class ModelLogin {
  String? userName;
  String? password;
  String? deviceId;
  String? language;

  ModelLogin({this.userName, this.password, this.deviceId, this.language});
}
