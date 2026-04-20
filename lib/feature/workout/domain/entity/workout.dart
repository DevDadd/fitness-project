import 'package:fitnessai/feature/workout/domain/entity/instruction.dart';

class Workout {
  final String? key;
  final String? id;
  final String? rev;
  final String? title;
  final String? desc;
  final String? level;
  final String? type;
  final double? rating;
  final String? url;
  final double? metValue;
  final List<InstructionEntity>? instructions;
  const Workout({
    this.key,
    this.rev,
    this.id,
    this.title,
    this.desc,
    this.level,
    this.type,
    this.rating,
    this.url,
    this.metValue,
    this.instructions,
  });
}
