

class BuyTicket {
  int id;
  String dateAdded;
  String dateEventStart;
  String dateEventEnd;
  String eventReference;
  String eventTitle;
  String ticketTitle;
  String paymentMethod;
  String reference;
  double unitPrice;
  double totalPrice;
  int quantity;
  bool state;
  String datePaid;
  int userId;
  int eventId;

  BuyTicket({
     this.id = 0,
     required this.dateAdded ,
     required this.dateEventStart,
     required this.dateEventEnd,
     this.eventReference='',
     required this.eventTitle,
     required this.ticketTitle,
     this.paymentMethod='',
     this.reference='',
     required this.unitPrice,
     required this.totalPrice,
     required this.quantity,
     this.state = false,
     this.datePaid = '',
     required this.userId,
     required this.eventId,
  });

  // Factory constructor to create a BuyTicket object from a json (e.g., from database query)
  factory BuyTicket.fromJson(Map<String, dynamic> json) {
    return BuyTicket(
      id: int.parse(json['idbuyticket']),
      dateAdded: json['dateaddbuyticket'].toString(),
      dateEventStart: json['datedebuteventbuyticket'].toString(),
      dateEventEnd: json['datefineventbuyticket'].toString(),
      eventReference: json['refeventbuyticket'].toString(),
      eventTitle: json['titreeventbuyticket'].toString(),
      ticketTitle: json['titreticketbuyticket'].toString(),
      paymentMethod: json['methodepayerbuyticket'].toString(),
      reference: json['refbuyticket'].toString(),
      unitPrice: double.parse(json['prixunitbuyticket']),
      totalPrice: double.parse(json['prixtotalbuyticket']),
      quantity: int.parse(json['qtebuyticket']),
      state: json['etatbuyticket'] == 1,
      datePaid: json['datepayerbuyticket'].toString(),
      userId: int.parse(json['iduserbuyticket']),
      eventId: int.parse(json['ideventbuyticket']),
    );
  }

  // Convert the BuyTicket object to a json for database operations
  Map<String, dynamic> toJson() {
    return {
      'idbuyticket': id.toString(),
      'dateaddbuyticket': dateAdded,
      'datedebuteventbuyticket': dateEventStart,
      'datefineventbuyticket': dateEventEnd,
      'refeventbuyticket': eventReference='dv',
      'titreeventbuyticket': eventTitle,
      'titreticketbuyticket': ticketTitle,
      'methodepayerbuyticket': paymentMethod,
      'refbuyticket': reference=quantity.toString()+dateEventEnd.substring(0,5)+ticketTitle.substring(2,5)+'${6*8/id}',
      'prixunitbuyticket': unitPrice.toString(),
      'prixtotalbuyticket': totalPrice.toString(),
      'qtebuyticket': quantity.toString(),
      'etatbuyticket': state.toString(),
      'datepayerbuyticket': datePaid,
      'iduserbuyticket': userId.toString(),
      'ideventbuyticket': eventId.toString(),
    };
  }

  
}
