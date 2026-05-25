import 'package:json_annotation/json_annotation.dart';
part 'detect_model.g.dart';

@JsonSerializable()
class DetectModel {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "job_id")
  String? jobId;

  DetectModel({this.success, this.jobId});

  factory DetectModel.fromJson(Map<String, dynamic> json) =>
      _$DetectModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetectModelToJson(this);
}
