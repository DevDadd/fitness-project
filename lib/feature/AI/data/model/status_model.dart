import 'dart:convert';

import 'package:fitnessai/feature/AI/data/model/analyse_result.dart';
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  AnalysisResult? analysis;

  StatusModel({this.success, this.status, this.resultUrl, this.analysis});

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    final model = _$StatusModelFromJson(json);

    final response = json['llm_response'];

    if (response != null && response is String && response.isNotEmpty) {
      try {
        model.analysis = AnalysisResult.fromJson(jsonDecode(response));
      } catch (_) {}
    }

    return model;
  }

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}
