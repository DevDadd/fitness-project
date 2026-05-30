import 'package:json_annotation/json_annotation.dart';

part 'analyze_exercises_request.g.dart';

@JsonSerializable()
class AnalyzeExerciseRequest {
  @JsonKey(name: 'video_url')
  final String videoUrl;

  final String exercise;

  final String mode;

  @JsonKey(name: 'user_id')
  final String userId;

  AnalyzeExerciseRequest({
    required this.videoUrl,
    required this.exercise,
    required this.mode,
    required this.userId,
  });

  factory AnalyzeExerciseRequest.fromJson(Map<String, dynamic> json) =>
      _$AnalyzeExerciseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyzeExerciseRequestToJson(this);
}
