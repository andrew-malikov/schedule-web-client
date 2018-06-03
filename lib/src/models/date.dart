class Date {
  int year;
  int month;
  int day;

  Date(this.year, this.month, this.day);

  factory Date.fromJson(Map<String, dynamic> graph) =>
      new Date(graph['Year'], graph['Month'], graph['Day']);
}
