import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelToken {
  @JsonProperty(name: 'UserId')
  final int userId;

  @JsonProperty(name: 'FirstName')
  final String firstName;

  @JsonProperty(name: 'LastName')
  final String lastName;

  @JsonProperty(name: 'Email')
  final String email;

  @JsonProperty(name: 'GsmNumber')
  final String gsmNumber;

  String get fullName => '$firstName $lastName';

  ModelToken({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gsmNumber,
  });
}
