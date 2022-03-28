import 'package:json_annotation/json_annotation.dart';

part 'feedback_model.g.dart';

@JsonSerializable()
class FeedbackModel {
  final String rate;
  final String description;

  FeedbackModel({
    required this.rate,
    required this.description,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return _$FeedbackModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FeedbackModelToJson(this);
  }
}
