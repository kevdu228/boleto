class Ticket {
  int id;
  int availableTickets;
  String reference;
  int eventId;
  DateTime creationDate;
  String title;
  String about;
  double price;
  bool state;

  Ticket({
    required this.id,
    required this.availableTickets,
    required this.reference,
    required this.eventId,
    required this.creationDate,
    required this.title,
    required this.about,
    required this.price,
    required this.state,
  });

  // Factory constructor to create a Ticket object from a map (e.g., from database query)
  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['idticket'],
      availableTickets: map['nbreticketdispo'],
      reference: map['refticket'],
      eventId: map['ideventticket'],
      creationDate: DateTime.parse(map['datecreationticket']),
      title: map['titreticket'],
      about: map['aboutticket'],
      price: map['prixticket'],
      state: map['etatticket'] == 1,
    );
  }

  // Convert the Ticket object to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      'idticket': id,
      'nbreticketdispo': availableTickets,
      'refticket': reference,
      'ideventticket': eventId,
      'datecreationticket': creationDate.toIso8601String(),
      'titreticket': title,
      'aboutticket': about,
      'prixticket': price,
      'etatticket': state ? 1 : 0,
    };
  }
}
