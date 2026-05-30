// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyze_exercises_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyzeExerciseRequest _$AnalyzeExerciseRequestFromJson(
  Map<String, dynamic> json,
) => AnalyzeExerciseRequest(
  videoUrl: json['video_url'] as String,
  exercise: json['exercise'] as String,
  mode: json['mode'] as String,
  userId: json['user_id'] as String,
);

Map<String, dynamic> _$AnalyzeExerciseRequestToJson(
  AnalyzeExerciseRequest instance,
) => <String, dynamic>{
  'video_url': instance.videoUrl,
  'exercise': instance.exercise,
  'mode': instance.mode,
  'user_id': instance.userId,
};
