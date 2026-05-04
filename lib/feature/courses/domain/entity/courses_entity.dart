class CoursesEntity {
  final String id;
  final String title;
  final String description;
  final String difficulty;
  final int duration;
  final String goal;
  final String imageUrl;

  CoursesEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.duration,
    required this.goal,
    required this.imageUrl,
  });
}
