// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutModel _$WorkoutModelFromJson(Map<String, dynamic> json) => WorkoutModel(
  key: json['_key'] as String?,
  id: json['_id'] as String?,
  rev: json['_rev'] as String?,
  desc: json['description'] as String?,
  level: json['level'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  title: json['title'] as String?,
  type: json['type'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$WorkoutModelToJson(WorkoutModel instance) =>
    <String, dynamic>{
      '_key': instance.key,
      '_id': instance.id,
      '_rev': instance.rev,
      'description': instance.desc,
      'level': instance.level,
      'rating': instance.rating,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
