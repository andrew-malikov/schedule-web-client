class Room {
  String number;

  Room(this.number);

  factory Room.fromJson(Map<String, dynamic> graph) =>
      new Room(graph['Number']);
}
