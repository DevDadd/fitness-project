// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyze_exercises_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyzeExerciseRequest _$AnalyzeExerciseRequestFromJson(
  Map<String, dynamic> json,
) => AnalyzeExerciseRequest(
  videoUrl: json['videoUrl'] as String,
  exercise: json['exercise'] as String,
  mode: json['mode'] as String,
  userId: json['userId'] as String,
);

Map<String, dynamic> _$AnalyzeExerciseRequestToJson(
  AnalyzeExerciseRequest instance,
) => <String, dynamic>{
  'videoUrl': instance.videoUrl,
  'exercise': instance.exercise,
  'mode': instance.mode,
  'userId': instance.userId,
};
