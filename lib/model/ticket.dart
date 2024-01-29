import 'package:boleto_scan/model/constants.dart';
import 'package:boleto_scan/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Ticket {
  int id;
  String availableTickets;
  String reference;
  int eventId;
  String creationDate;
  String title;
  String about;
  double price;
  String state;

  Ticket({
     this.id = 0,
     this.availableTickets = '',
     this.reference = '',
     this.eventId = 0,
     this.creationDate='',
     this.title = '',
     this.about = '',
     this.price = 0,
     this.state = '',
  });

  // Factory constructor to create a Ticket object from a map (e.g., from database query)
  factory Ticket.fromJson(Map<String, dynamic> json) {
    
    Ticket ticket = Ticket(
      id: int.parse(json['idticket']),
      availableTickets: json['nbreticketdispo'],
      reference: json['refticket'],
      eventId: int.parse(json['ideventticket']),
      creationDate: json['datecreationticket'].toString(),
      title: json['titreticket'],
      about: json['aboutticket'],
      price: double.parse(json['prixticket']),
      state: json['etatticket'] ,
    );
    
    

    
    return ticket;
  }

  // Convert the Ticket object to a map for database operations
  Map<String, dynamic> toJson() {
    return {
      'idticket': id,
      'nbreticketdispo': availableTickets,
      'refticket': reference,
      'ideventticket': eventId,
      'datecreationticket': creationDate,
      'titreticket': title,
      'aboutticket': about,
      'prixticket': price,
      'etatticket': state ,
    };
  }
  deleteTicket(Ticket ticket) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/deleteTicket.php"),
      body: ticket.toJson()
    );

    if( httpQuery.statusCode== 200){
      return json.decode(httpQuery.body)["msg"];
    }
    

  }

  Future getUserTicket(User user) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/getTicket.php")
      ,body: user.toJson()
    );
    
    
    if (httpQuery.statusCode == 200 ){
      
      try{
        
        
        
        }catch(e){
        
        return null;
      }
  
    
  }
}
}
