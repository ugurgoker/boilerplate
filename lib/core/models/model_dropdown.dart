import 'package:dart_json_mapper/dart_json_mapper.dart' show jsonSerializable;

@jsonSerializable
class ModelDropdown {
  final int id;
  final String title;
  final int? parentId;
  final String? text;

  ModelDropdown({required this.id, required this.title, this.parentId, this.text});
}