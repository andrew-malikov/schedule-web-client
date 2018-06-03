import 'package:schedule_web_client/src/models/date.dart';
import 'package:schedule_web_client/src/models/lesson.dart';

class Day {
  Date date;
  List<Lesson> lessons;

  Day(this.date);

  factory Day.fromJson(Map<String, dynamic> graph) {
    final date = new Date.fromJson(graph['Date']);

    var lessons = new List<Lesson>();
    if (graph.containsKey('Lessons')) lessons = _extractLessons(graph);

    return new Day(date)..lessons = lessons;
  }
}

List<Lesson> _extractLessons(Map<String, dynamic> graph) {
  return graph['Lessons'].map((value) => new Lesson.fromJson(value)).toList();
}
