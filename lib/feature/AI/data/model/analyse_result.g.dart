// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyse_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisResult _$AnalysisResultFromJson(Map<String, dynamic> json) =>
    AnalysisResult(
      overall: json['overall'] as String?,
      goodPoints: (json['good_points'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mainIssues: (json['main_issues'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      advice: (json['advice'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      stats: json['stats'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AnalysisResultToJson(AnalysisResult instance) =>
    <String, dynamic>{
      'overall': instance.overall,
      'good_points': instance.goodPoints,
      'main_issues': instance.mainIssues,
      'advice': instance.advice,
      'stats': instance.stats,
    };
