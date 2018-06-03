class Tutor {
  String longName;
  String shortName;

  Tutor(this.longName, this.shortName);

  factory Tutor.fromJson(Map<String, dynamic> graph) =>
      new Tutor(graph['LongName'], graph['ShortName']);
}
