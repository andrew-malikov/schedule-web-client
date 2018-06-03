import 'package:schedule_web_client/src/models/discipline.dart';
import 'package:schedule_web_client/src/models/group.dart';
import 'package:schedule_web_client/src/models/lessonType.dart';
import 'package:schedule_web_client/src/models/room.dart';
import 'package:schedule_web_client/src/models/time.dart';
import 'package:schedule_web_client/src/models/tutor.dart';

class Lesson {
  List<Group> groups;
  List<Tutor> tutors;
  List<Room> rooms;
  Discipline discipline;
  Time time;
  LessonType type;

  Lesson(this.discipline, this.time, this.type);

  factory Lesson.fromJson(Map<String, dynamic> graph) {
    final discipline = new Discipline.fromJson(graph['Discipline']);
    final time = new Time.fromJson(graph['Time']);
    final type = new LessonType.fromJson(graph['Type']);

    var groups = new List<Group>();
    if (graph.containsKey('Groups')) groups = _extractGroups(graph);

    var tutors = new List<Tutor>();
    if (graph.containsKey('Tutors')) tutors = _extractTutors(graph);

    var rooms = new List<Room>();
    if (graph.containsKey('Rooms')) rooms = _extractRooms(graph);

    final lesson = new Lesson(discipline, time, type);

    lesson.groups = groups;
    lesson.tutors = tutors;
    lesson.rooms = rooms;

    return lesson;
  }
}

List<Group> _extractGroups(Map<String, dynamic> graph) {
  return graph['Groups']
      .map((value) => new Group.fromShortJson(value))
      .toList();
}

List<Tutor> _extractTutors(Map<String, dynamic> graph) {
  return graph['Tutors'].map((value) => new Tutor.fromJson(value)).toList();
}

List<Room> _extractRooms(Map<String, dynamic> graph) {
  return graph['Rooms'].map((value) => new Room.fromJson(value)).toList();
}
