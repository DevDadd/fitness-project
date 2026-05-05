import 'package:fitnessai/feature/courses/domain/entity/courses_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'courses_model.g.dart';

@JsonSerializable()
class CoursesModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'difficulty')
  String? difficulty;
  @JsonKey(name: 'duration')
  int? duration;
  @JsonKey(name: 'goal')
  String? goal;
  @JsonKey(name: 'thumbnail')
  String? thumbnail;

  CoursesModel({
    this.id,
    this.title,
    this.description,
    this.difficulty,
    this.duration,
    this.goal,
    this.thumbnail,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) =>
      _$CoursesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesModelToJson(this);
}

extension CoursesModelMapper on CoursesModel {
  CoursesEntity toEntity() {
    return CoursesEntity(
      id: id ?? '',
      title: title ?? '',
      description: description ?? '',
      difficulty: difficulty ?? '',
      duration: duration ?? 0,
      goal: goal ?? '',
      imageUrl: thumbnail ?? '',
    );
  }
}
