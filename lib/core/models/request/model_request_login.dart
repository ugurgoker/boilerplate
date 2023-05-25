import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelRequestLogin {
  final String email;
  final String password;

  ModelRequestLogin({required this.email, required this.password});
}