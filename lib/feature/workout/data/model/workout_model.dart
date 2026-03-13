import 'package:fitnessai/feature/workout/domain/entity/workout.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_model.g.dart';

@JsonSerializable()
class WorkoutModel {
  @JsonKey(name: "_key")
  String? key;

  @JsonKey(name: "_id")
  String? id;

  @JsonKey(name: "_rev")
  String? rev;

  @JsonKey(name: "Desc")
  String? desc;

  @JsonKey(name: "Level")
  String? level;

  @JsonKey(name: "Rating")
  double? rating;

  @JsonKey(name: "Title")
  String? title;

  @JsonKey(name: "Type")
  String? type;

  @JsonKey(name: "url")
  String? url;

  WorkoutModel({
    this.key,
    this.id,
    this.rev,
    this.desc,
    this.level,
    this.rating,
    this.title,
    this.type,
    this.url,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutModelToJson(this);
}

extension WorkoutModelMapper on WorkoutModel {
  Workout toEntity() {
    return Workout(
      id: id,
      title: title,
      desc: desc,
      level: level,
      type: type,
      rating: rating,
      url: url,
    );
  }
}