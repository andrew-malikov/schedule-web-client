import 'package:schedule_web_client/src/models/day.dart';

class Schedule {
  List<Day> days;

  Schedule();

  factory Schedule.fromJson(Map<String, dynamic> graph) {
    var days = new List<Day>();
    if (graph.containsKey('Days')) days = _extractDays(graph);

    return new Schedule()..days = days;
  }
}

List<Day> _extractDays(Map<String, dynamic> graph) {
  return graph['Days'].map((value) => new Day.fromJson(value)).toList();
}
