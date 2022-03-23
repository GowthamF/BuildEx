import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String firstName;
  final String lastName;
  final String mobile;
  final String email;
  final List<String> roles;
  final List<String> jwtTokens;
  final List<Map<String, dynamic>> refreshTokens;
  final bool locked;
  final bool isActive;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.isActive,
    required this.jwtTokens,
    required this.locked,
    required this.refreshTokens,
    required this.roles,
  });
}
