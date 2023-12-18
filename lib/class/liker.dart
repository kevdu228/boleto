class Liker {
  int id;
  DateTime dateLiked;
  int eventId;
  int userId;

  Liker({
    required this.id,
    required this.dateLiked,
    required this.eventId,
    required this.userId,
  });

  // Factory constructor to create a Liker object from a map (e.g., from database query)
  factory Liker.fromMap(Map<String, dynamic> map) {
    return Liker(
      id: map['idliker'],
      dateLiked: DateTime.parse(map['dateliker']),
      eventId: map['ideventliker'],
      userId: map['iduserliker'],
    );
  }

  // Convert the Liker object to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      'idliker': id,
      'dateliker': dateLiked.toIso8601String(),
      'ideventliker': eventId,
      'iduserliker': userId,
    };
  }
}
