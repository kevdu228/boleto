
import 'package:boleto_scan/model/ticket.dart';
import 'constants.dart' ;
import 'package:http/http.dart' as http;

class Event{
  int id;
  String reference;
  String title;
  String about;
  String mapLatitude;
  String mapLongitude;
  String country;
  String city;
  String address;
  String category;
  String whatsapp;
  String telegram;
  String createDate,startDate,endDate ;
  String imgFirst;
  String imgSecond;
  String imgLast;
  int userId;
  int likeCount;
  bool state;
  bool special;
  bool treeState;
  String contact1;
  String contact2;
  List<Ticket> tickets = [];

  Event({
      this.id=0,
      this.reference='',
      this.title = '',
      this.about ='',
     this.mapLatitude ='',
     this.mapLongitude ='',
     this.country ='',
     this.city ='',
     this.address ='',
     this.category ='',
     this.whatsapp ='',
     this.telegram ='',
     this.createDate ='',
     this.startDate='',
     this.endDate = '',
     this.imgFirst ='',
     this.imgSecond ='',
     this.imgLast ='',
     this.userId = 0,
     this.likeCount = 0,
     this.state = false,
     this.special = false,
     this.treeState = false,
     this.contact1 ='',
     this.contact2 ='',
     List<Ticket> tickets= const [], 
  });
  

  // Factory constructor to create an Event object from a json (e.g., from database query)
  factory Event.fromJson(Map<String, dynamic> json) {
    //print(json);
    Event event = Event(
      id: int.parse(json['idevent']),
      reference: json['refevent'].toString(),
      title: json['titreevent'],
      about: json['aboutevent'].toString(),
      mapLatitude: json['maplatevent'].toString(),
      mapLongitude: json['maplongevent'].toString(),
      country: json['payseevent'].toString(),
      city: json['villeevent'].toString(),
      address: json['adresseevent'].toString(),
      category: json['idCat'].toString(),
      whatsapp: json['whatsapevent'].toString(),
      telegram: json['telegramevent'].toString(),// DateTime.parse(json['startdateevent'].toString().replaceAll(":","-"))
      createDate: json['createdateevent'].toString(),
      startDate: json['startdateevent'].toString(),
      endDate: json['enddateevent'].toString(),
      imgFirst: json['imgfirstevent'].toString(),
      imgSecond: json['imgsecondevent'].toString(),
      imgLast: json['imglastevent'].toString(),
      userId: int.parse(json['iduserevent']),
      likeCount: int.parse(json['nbrlikeevent']??"0"),
      state: json['etatevent'] == 1,
      special: json['specialevent'] == 1,
      treeState: json['etatreelevent'] == 1,
      contact1: json['contactevent1'].toString(),
      contact2: json['contactevent2'].toString(),
      tickets:(json['ticket'] as List).map((index) => Ticket.fromJson(index)).toList()
    );
    List<Ticket> tick = [];
    for(int i = 0;i<(json['ticket'] as List).length;i++){
      tick.add(Ticket.fromJson(json['ticket'][i]));
    }
    //print(tick[0].reference);
    event.tickets = tick;
    

    //print((json['ticket'] as List).map((index) => Ticket.fromJson(index)).toList());
    return event;
  }

  // Convert the Event object to a map for database operations
  Map<String, dynamic> toJson() {
    return {
      'idevent': id,
      'refevent': reference,
      'titreevent': title,
      'aboutevent': about,
      'maplatevent': mapLatitude,
      'maplongevent': mapLongitude,
      'payseevent': country,
      'villeevent': city,
      'adresseevent': address,
      'catevent': category,
      'whatsapevent': whatsapp,
      'telegramevent': telegram,
      'createdateevent': createDate,
      'startdateevent': startDate,
      'enddateevent': endDate,
      'imgfirstevent': imgFirst,
      'imgsecondevent': imgSecond,
      'imglastevent': imgLast,
      'iduserevent': userId,
      'nbrlikeevent': likeCount,
      'etatevent': state ? 1 : 0,
      'specialevent': special ? 1 : 0,
      'etatreelevent': treeState ? 1 : 0,
      'contactevent1': contact1,
      'contactevent2': contact2,
      'ticket':tickets

    };
  }

   
  
  Future addEvent(Event event) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/addEvents.php"),
      body: event.toJson()
    );
    
    
    if (httpQuery.statusCode == 200 ){
      
      try{
        
        }catch(e){
        
        return null;
      }
  
    
  }
}

  Future editEvent(Event event) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/editEvents.php"),
      body: event.toJson()
    );
    
    
    if (httpQuery.statusCode == 200 ){
      
      try{
        
        }catch(e){
        
        return null;
      }
  
    
  }
}
  
  Future deleteEvent(Event event) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/deleteEvents.php"),
      body: event.toJson()
    );
    
    
    if (httpQuery.statusCode == 200 ){
      
      try{
        
        }catch(e){
        
        return null;
      }
  
    
  }
}

}
