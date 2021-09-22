import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, jsonSerializable;

@jsonSerializable 
class ModelCorporation {
  final String? id;

  ModelCorporation({this.id});

  factory ModelCorporation.fromJson(Map<String, dynamic> json) => JsonMapper.deserialize<ModelCorporation>(jsonEncode(json)) as ModelCorporation;
  Map<String, dynamic> toJson() => jsonDecode(JsonMapper.serialize(this));
}