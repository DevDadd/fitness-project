// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutModel _$WorkoutModelFromJson(Map<String, dynamic> json) => WorkoutModel(
  key: json['_key'] as String?,
  id: json['_id'] as String?,
  rev: json['_rev'] as String?,
  desc: json['Desc'] as String?,
  level: json['Level'] as String?,
  rating: (json['Rating'] as num?)?.toDouble(),
  title: json['Title'] as String?,
  type: json['Type'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$WorkoutModelToJson(WorkoutModel instance) =>
    <String, dynamic>{
      '_key': instance.key,
      '_id': instance.id,
      '_rev': instance.rev,
      'Desc': instance.desc,
      'Level': instance.level,
      'Rating': instance.rating,
      'Title': instance.title,
      'Type': instance.type,
      'url': instance.url,
    };
