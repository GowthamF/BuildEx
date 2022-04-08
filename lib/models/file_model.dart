import 'package:json_annotation/json_annotation.dart';

part 'file_model.g.dart';

@JsonSerializable()
class FileModel {
  final String downloadUrl;
  final String path;

  FileModel(
    this.downloadUrl,
    this.path,
  );

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return _$FileModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FileModelToJson(this);
  }
}
