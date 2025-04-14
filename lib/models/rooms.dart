class Room {
  final String name;

  Room({required this.name});

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(name: map['name'] ?? '');
  }

  Map<String, dynamic> toMap() => {'name': name};
}
