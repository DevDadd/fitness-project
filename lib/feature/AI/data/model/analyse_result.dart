import 'package:json_annotation/json_annotation.dart';

part 'analyse_result.g.dart';

@JsonSerializable()
class AnalysisResult {
  @JsonKey(name: 'overall')
  final String? overall;

  @JsonKey(name: 'good_points')
  final List<String>? goodPoints;

  @JsonKey(name: 'main_issues')
  final List<String>? mainIssues;

  @JsonKey(name: 'advice')
  final List<String>? advice;

  @JsonKey(name: 'stats')
  final Map<String, dynamic>? stats;

  AnalysisResult({
    this.overall,
    this.goodPoints,
    this.mainIssues,
    this.advice,
    this.stats,
  });

  factory AnalysisResult.fromJson(Map<String, dynamic> json) =>
      _$AnalysisResultFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisResultToJson(this);
}
