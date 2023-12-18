class BuyTicket {
  int id;
  DateTime dateAdded;
  DateTime dateEventStart;
  DateTime dateEventEnd;
  String eventReference;
  String eventTitle;
  String ticketTitle;
  String paymentMethod;
  String reference;
  double unitPrice;
  double totalPrice;
  int quantity;
  bool state;
  DateTime datePaid;
  int userId;
  int eventId;

  BuyTicket({
    required this.id,
    required this.dateAdded,
    required this.dateEventStart,
    required this.dateEventEnd,
    required this.eventReference,
    required this.eventTitle,
    required this.ticketTitle,
    required this.paymentMethod,
    required this.reference,
    required this.unitPrice,
    required this.totalPrice,
    required this.quantity,
    required this.state,
    required this.datePaid,
    required this.userId,
    required this.eventId,
  });

  // Factory constructor to create a BuyTicket object from a map (e.g., from database query)
  factory BuyTicket.fromMap(Map<String, dynamic> map) {
    return BuyTicket(
      id: map['idbuyticket'],
      dateAdded: DateTime.parse(map['dateaddbuyticket']),
      dateEventStart: DateTime.parse(map['datedebuteventbuyticket']),
      dateEventEnd: DateTime.parse(map['datefineventbuyticket']),
      eventReference: map['refeventbuyticket'],
      eventTitle: map['titreeventbuyticket'],
      ticketTitle: map['titreticketbuyticket'],
      paymentMethod: map['methodepayerbuyticket'],
      reference: map['refbuyticket'],
      unitPrice: map['prixunitbuyticket'],
      totalPrice: map['prixtotalbuyticket'],
      quantity: map['qtebuyticket'],
      state: map['etatbuyticket'] == 1,
      datePaid: DateTime.parse(map['datepayerbuyticket']),
      userId: map['iduserbuyticket'],
      eventId: map['ideventbuyticket'],
    );
  }

  // Convert the BuyTicket object to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      'idbuyticket': id,
      'dateaddbuyticket': dateAdded.toIso8601String(),
      'datedebuteventbuyticket': dateEventStart.toIso8601String(),
      'datefineventbuyticket': dateEventEnd.toIso8601String(),
      'refeventbuyticket': eventReference,
      'titreeventbuyticket': eventTitle,
      'titreticketbuyticket': ticketTitle,
      'methodepayerbuyticket': paymentMethod,
      'refbuyticket': reference,
      'prixunitbuyticket': unitPrice,
      'prixtotalbuyticket': totalPrice,
      'qtebuyticket': quantity,
      'etatbuyticket': state ? 1 : 0,
      'datepayerbuyticket': datePaid.toIso8601String(),
      'iduserbuyticket': userId,
      'ideventbuyticket': eventId,
    };
  }
}
