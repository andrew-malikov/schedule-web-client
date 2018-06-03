import 'package:schedule_web_client/src/models/course.dart';
import 'package:schedule_web_client/src/models/faculty.dart';

class Group {
  int id;
  String name;
  Faculty faculty;
  Course course;

  Group(this.name);

  factory Group.fromShortJson(Map<String, dynamic> graph) =>
      new Group(graph['Name'])..id = _toInt(graph['Id']);

  factory Group.fromDetailedJson(Map<String, dynamic> graph) {
    final group = new Group(graph['Name'])..id = _toInt(graph['Id']);

    group.faculty = new Faculty.fromJson(graph['Faculty']);
    group.course = new Course.fromJson(graph['Course']);

    return group;
  }
}

int _toInt(id) => id is int ? id : int.parse(id);
