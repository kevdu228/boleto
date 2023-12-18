class Message {
  int id;
  DateTime date;
  String text;
  int senderUserId;
  int receiverUserId;

  Message({
    required this.id,
    required this.date,
    required this.text,
    required this.senderUserId,
    required this.receiverUserId,
  });

  // Factory constructor to create a Message object from a map (e.g., from database query)
  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['idsms'],
      date: DateTime.parse(map['datesms']),
      text: map['textsms'],
      senderUserId: map['idusersmssender'],
      receiverUserId: map['idusersmsrecever'],
    );
  }

  // Convert the Message object to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      'idsms': id,
      'datesms': date.toIso8601String(),
      'textsms': text,
      'idusersmssender': senderUserId,
      'idusersmsrecever': receiverUserId,
    };
  }
}
