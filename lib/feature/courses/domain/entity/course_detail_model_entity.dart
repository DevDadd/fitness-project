class CoursesDetailEntity {
  final String? key;
  final String? id;
  final String? rev;
  final String? thumbnail;
  final String? description;
  final String? difficulty;
  final int? duration;
  final String? goal;
  final String? title;
  final List<ExerciseEntity>? exercises;

  const CoursesDetailEntity({
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
}

class ExerciseEntity {
  final String? id;
  final String? key;
  final String? rev;
  final String? description;
  final List<InstructionEntity>? instructions;
  final String? level;
  final double? metValue;
  final double? rating;
  final String? title;
  final String? type;
  final String? url;
  final int? sets;
  final String? reps;
  final int? order;

  const ExerciseEntity({
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
}

class InstructionEntity {
  final String? content;
  final int? step;
  final String? title;
  final List<String>? safetyTips;

  const InstructionEntity({
    this.content,
    this.step,
    this.title,
    this.safetyTips,
  });
}
