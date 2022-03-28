import 'package:json_annotation/json_annotation.dart';

part 'service_center_model.g.dart';

@JsonSerializable()
class ServiceCenterModel {
  final String name;
  final String address;

  ServiceCenterModel({
    required this.name,
    required this.address,
  });

  factory ServiceCenterModel.fromJson(Map<String, dynamic> json) {
    return _$ServiceCenterModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ServiceCenterModelToJson(this);
  }
}
