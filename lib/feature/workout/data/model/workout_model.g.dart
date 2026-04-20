// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutModel _$WorkoutModelFromJson(Map<String, dynamic> json) => WorkoutModel(
  key: json['_key'] as String?,
  id: json['_id'] as String?,
  rev: json['_rev'] as String?,
  description: json['description'] as String?,
  level: json['level'] as String?,
  metValue: (json['met_value'] as num?)?.toDouble(),
  rating: (json['rating'] as num?)?.toDouble(),
  title: json['title'] as String?,
  type: json['type'] as String?,
  url: json['url'] as String?,
  instructions: (json['instructions'] as List<dynamic>?)
      ?.map((e) => Instruction.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WorkoutModelToJson(WorkoutModel instance) =>
    <String, dynamic>{
      '_key': instance.key,
      '_id': instance.id,
      '_rev': instance.rev,
      'description': instance.description,
      'level': instance.level,
      'met_value': instance.metValue,
      'rating': instance.rating,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
      'instructions': instance.instructions,
    };

Instruction _$InstructionFromJson(Map<String, dynamic> json) => Instruction(
  step: (json['step'] as num?)?.toInt(),
  title: json['title'] as String?,
  content: json['content'] as String?,
  safetyTips: (json['safety_tips'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$InstructionToJson(Instruction instance) =>
    <String, dynamic>{
      'step': instance.step,
      'title': instance.title,
      'content': instance.content,
      'safety_tips': instance.safetyTips,
    };
