import 'package:json_annotation/json_annotation.dart';
import 'package:fitnessai/feature/courses/domain/entity/course_detail_model_entity.dart';

part 'courses_detail_model.g.dart';

@JsonSerializable()
class CoursesDetailModel {
  @JsonKey(name: "_key")
  String? key;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "_rev")
  String? rev;
  @JsonKey(name: "thumbnail")
  String? thumbnail;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "difficulty")
  String? difficulty;
  @JsonKey(name: "duration")
  int? duration;
  @JsonKey(name: "goal")
  String? goal;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "exercises")
  List<Exercise?>? exercises;

  CoursesDetailModel({
    this.key,
    this.id,
    this.rev,
    this.thumbnail,
    this.description,
    this.difficulty,
    this.duration,
    this.goal,
    this.title,
    this.exercises,
  });

  factory CoursesDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CoursesDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesDetailModelToJson(this);
}

@JsonSerializable()
class Exercise {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "_key")
  String? key;
  @JsonKey(name: "_rev")
  String? rev;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "instructions")
  List<Instruction>? instructions;
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
  @JsonKey(name: "sets")
  int? sets;
  @JsonKey(name: "reps")
  String? reps;
  @JsonKey(name: "order")
  int? order;

  Exercise({
    this.id,
    this.key,
    this.rev,
    this.description,
    this.instructions,
    this.level,
    this.metValue,
    this.rating,
    this.title,
    this.type,
    this.url,
    this.sets,
    this.reps,
    this.order,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}

@JsonSerializable()
class Instruction {
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "step")
  int? step;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "safety_tips")
  List<String>? safetyTips;

  Instruction({this.content, this.step, this.title, this.safetyTips});

  factory Instruction.fromJson(Map<String, dynamic> json) =>
      _$InstructionFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionToJson(this);
}

extension CoursesDetailModelMapper on CoursesDetailModel {
  CoursesDetailEntity toEntity() {
    return CoursesDetailEntity(
      key: key,
      id: id,
      rev: rev,
      thumbnail: thumbnail,
      description: description,
      difficulty: difficulty,
      duration: duration,
      goal: goal,
      title: title,
      exercises: exercises?.whereType<Exercise>().map((e) => e.toEntity()).toList(),
    );
  }
}

extension ExerciseMapper on Exercise {
  ExerciseEntity toEntity() {
    return ExerciseEntity(
      id: id,
      key: key,
      rev: rev,
      description: description,
      instructions: instructions?.map((i) => i.toEntity()).toList(),
      level: level,
      metValue: metValue,
      rating: rating,
      title: title,
      type: type,
      url: url,
      sets: sets,
      reps: reps,
      order: order,
    );
  }
}

extension InstructionMapper on Instruction {
  InstructionEntity toEntity() {
    return InstructionEntity(
      content: content,
      step: step,
      title: title,
      safetyTips: safetyTips,
    );
  }
}
