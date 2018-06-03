class Course {
  String name;
  int number;

  Course(this.name, this.number);

  factory Course.fromJson(Map<String, dynamic> graph) =>
      new Course(graph['Name'], graph['Number']);
}
