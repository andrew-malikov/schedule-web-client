class LessonType {
  String name;

  LessonType(this.name);

  factory LessonType.fromJson(Map<String, dynamic> graph) =>
      new LessonType(graph['Name']);
}
