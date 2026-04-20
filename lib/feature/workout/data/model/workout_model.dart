import 'package:fitnessai/feature/workout/domain/entity/instruction.dart';
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
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "level")
  String? level;
  @JsonKey(name: "met_value")
  double? metValue;
  @JsonKey(name: "rating")
  double? rating;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "instructions")
  List<Instruction>? instructions;

  WorkoutModel({
    this.key,
    this.id,
    this.rev,
    this.description,
    this.level,
    this.metValue,
    this.rating,
    this.title,
    this.type,
    this.url,
    this.instructions,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutModelToJson(this);
}

@JsonSerializable()
class Instruction {
  @JsonKey(name: "step")
  int? step;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "safety_tips")
  List<String>? safetyTips;

  Instruction({this.step, this.title, this.content, this.safetyTips});

  factory Instruction.fromJson(Map<String, dynamic> json) =>
      _$InstructionFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionToJson(this);
}

extension WorkoutModelMapper on WorkoutModel {
  Workout toEntity() {
    return Workout(
      key: key,
      rev: rev,
      id: id,
      title: title,
      desc: description,
      level: level,
      type: type,
      rating: rating,
      url: url,
      metValue: metValue,
      instructions: instructions?.map((e) => e.toEntity()).toList(),
    );
  }
}

extension InstructionMapper on Instruction {
  InstructionEntity toEntity() {
    return InstructionEntity(
      step: step,
      title: title,
      content: content,
      safetyTips: safetyTips,
    );
  }
}
