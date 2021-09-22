import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, JsonProperty, jsonSerializable;

@jsonSerializable
class ModelLoginResponse {
  final String? id;
  final String? userTypeId;

  @JsonProperty(name: 'auth_token')
  final String? authToken;

  @JsonProperty(name: 'expires_in')
  final int? expiresIn;

  final List<String>? roles;
  final String? permissions;

  @JsonProperty(name: 'change_password')
  final bool? changePassword;

  @JsonProperty(name: 'is_hr_role')
  final bool? isHrRole;

  @JsonProperty(name: 'is_user_contract_required')
  final bool? isUserContractRequired;
  
  final String? corpId;

  @JsonProperty(name: 'is_phone_confirmation_required')
  final bool? isPhoneConfirmationRequired;

  ModelLoginResponse({this.id, this.userTypeId, this.authToken, this.expiresIn, this.roles, this.permissions, this.changePassword, this.isHrRole, this.isUserContractRequired, this.corpId, this.isPhoneConfirmationRequired});

  factory ModelLoginResponse.fromJson(Map<String, dynamic> json) => JsonMapper.deserialize<ModelLoginResponse>(jsonEncode(json)) as ModelLoginResponse;
  Map<String, dynamic> toJson() => JsonMapper.serialize(this) as Map<String, dynamic>;

}