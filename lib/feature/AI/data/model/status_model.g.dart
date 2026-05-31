// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) => StatusModel(
  success: json['success'] as bool?,
  status: json['status'] as String?,
  resultUrl: json['result_url'] as String?,
);

Map<String, dynamic> _$StatusModelToJson(StatusModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'result_url': instance.resultUrl,
    };
