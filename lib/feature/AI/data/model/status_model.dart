import 'package:json_annotation/json_annotation.dart';

part 'status_model.g.dart';

@JsonSerializable()
class StatusModel {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "result_url")
  String? resultUrl;
  @JsonKey(name: "llm_response")
  String? llmResponse;

  StatusModel({this.success, this.status, this.resultUrl, this.llmResponse});

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}
