import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ResponseData {
  final bool success;
  final String? message;
  final String? error;

  const ResponseData({
    required this.success,
    this.message,
    this.error,
  });
}
