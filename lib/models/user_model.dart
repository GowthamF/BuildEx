import 'package:buildex/helpers/helpers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String firstName;
  final String lastName;
  final String mobile;
  final String email;
  final List<UserRoles> roles;
  final List<String> jwtTokens;
  final List<Map<String, dynamic>>? refreshTokens;
  final bool locked;
  final bool isActive;
  final String password;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.isActive,
    this.jwtTokens = const [],
    required this.locked,
    this.refreshTokens = const [],
    required this.roles,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
