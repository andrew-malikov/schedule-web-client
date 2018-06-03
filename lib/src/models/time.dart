class Time {
  String period;
  int number;

  Time(this.period, this.number);

  factory Time.fromJson(Map<String, dynamic> graph) =>
      new Time(graph['Period'], graph['Number']);
}
