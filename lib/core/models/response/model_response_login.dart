import 'package:dart_json_mapper/dart_json_mapper.dart';
import '../../../core/models/response_data.dart';

@jsonSerializable
class ModelResponseLogin extends ResponseData {
  final ModelLogin? data;

  const ModelResponseLogin({
    super.success = false,
    super.message,
    super.error,
    required this.data,
  });
}

@jsonSerializable
class ModelLogin {
  final String token;

  const ModelLogin({required this.token});
}
