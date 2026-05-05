// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesDetailModel _$CoursesDetailModelFromJson(Map<String, dynamic> json) =>
    CoursesDetailModel(
      key: json['_key'] as String?,
      id: json['_id'] as String?,
      rev: json['_rev'] as String?,
      thumbnail: json['thumbnail'] as String?,
      description: json['description'] as String?,
      difficulty: json['difficulty'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      goal: json['goal'] as String?,
      title: json['title'] as String?,
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null ? null : Exercise.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$CoursesDetailModelToJson(CoursesDetailModel instance) =>
    <String, dynamic>{
      '_key': instance.key,
      '_id': instance.id,
      '_rev': instance.rev,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'duration': instance.duration,
      'goal': instance.goal,
      'title': instance.title,
      'exercises': instance.exercises,
    };

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
  id: json['_id'] as String?,
  key: json['_key'] as String?,
  rev: json['_rev'] as String?,
  description: json['description'] as String?,
  instructions: (json['instructions'] as List<dynamic>?)
      ?.map((e) => Instruction.fromJson(e as Map<String, dynamic>))
      .toList(),
  level: json['level'] as String?,
  metValue: (json['met_value'] as num?)?.toDouble(),
  rating: (json['rating'] as num?)?.toDouble(),
  title: json['title'] as String?,
  type: json['type'] as String?,
  url: json['url'] as String?,
  sets: (json['sets'] as num?)?.toInt(),
  reps: json['reps'] as String?,
  order: (json['order'] as num?)?.toInt(),
);

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
  '_id': instance.id,
  '_key': instance.key,
  '_rev': instance.rev,
  'description': instance.description,
  'instructions': instance.instructions,
  'level': instance.level,
  'met_value': instance.metValue,
  'rating': instance.rating,
  'title': instance.title,
  'type': instance.type,
  'url': instance.url,
  'sets': instance.sets,
  'reps': instance.reps,
  'order': instance.order,
};

Instruction _$InstructionFromJson(Map<String, dynamic> json) => Instruction(
  content: json['content'] as String?,
  step: (json['step'] as num?)?.toInt(),
  title: json['title'] as String?,
  safetyTips: (json['safety_tips'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$InstructionToJson(Instruction instance) =>
    <String, dynamic>{
      'content': instance.content,
      'step': instance.step,
      'title': instance.title,
      'safety_tips': instance.safetyTips,
    };
