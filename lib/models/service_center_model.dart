import 'package:json_annotation/json_annotation.dart';

part 'service_center_model.g.dart';

@JsonSerializable()
class ServiceCenterModel {
  final String name;
  final String address;
  @JsonKey(name: '_id')
  final String id;

  ServiceCenterModel({
    required this.name,
    required this.address,
    required this.id,
  });

  factory ServiceCenterModel.fromJson(Map<String, dynamic> json) {
    return _$ServiceCenterModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ServiceCenterModelToJson(this);
  }
}
