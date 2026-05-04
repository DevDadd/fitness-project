// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesModel _$CoursesModelFromJson(Map<String, dynamic> json) => CoursesModel(
  id: json['id'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  difficulty: json['difficulty'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  goal: json['goal'] as String?,
  thumbnail: json['thumbnail'] as String?,
);

Map<String, dynamic> _$CoursesModelToJson(CoursesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'duration': instance.duration,
      'goal': instance.goal,
      'thumbnail': instance.thumbnail,
    };
