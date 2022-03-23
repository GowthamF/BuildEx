import 'package:json_annotation/json_annotation.dart';

part 'role_model.g.dart';

@JsonSerializable()
class RoleModel {
  final String name;
  final String code;
  final bool isActive;

  RoleModel({
    required this.name,
    required this.code,
    required this.isActive,
  });
}
