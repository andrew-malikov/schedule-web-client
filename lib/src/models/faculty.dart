class Faculty {
  String longName;
  String shortName;

  Faculty(this.longName, this.shortName);

  factory Faculty.fromJson(Map<String, dynamic> graph) =>
      new Faculty(graph['LongName'], graph['ShortName']);
}
