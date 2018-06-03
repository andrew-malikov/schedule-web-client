class Discipline {
  String longName;
  String shortName;

  Discipline(this.longName, this.shortName);

  factory Discipline.fromJson(Map<String, dynamic> graph) =>
      new Discipline(graph['Name'], graph['Title']);
}
