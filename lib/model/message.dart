import 'package:boleto_scan/model/user.dart';
import 'constants.dart' ;
import 'package:http/http.dart' as http;

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

  // Factory constructor to create a Message object from a json (e.g., from database query)
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['idsms'],
      date: DateTime.parse(json['datesms']),
      text: json['textsms'],
      senderUserId: json['idusersmssender'],
      receiverUserId: json['idusersmsrecever'],
    );
  }

  // Convert the Message object to a json for database operations
  Map<String, dynamic> toJson() {
    return {
      'idsms': id,
      'datesms': date.toIso8601String(),
      'textsms': text,
      'idusersmssender': senderUserId,
      'idusersmsrecever': receiverUserId,
    };
  }

  Future getMsg(User user) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/getEvents.php"),
      body: user.toJson()
    );
    
    
    if (httpQuery.statusCode == 200 ){
      
      try{
        
        }catch(e){
        
        return null;
      }
  
    
  }
}
  
  Future addMsg(Message msg) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/addEvents.php"),
      body: msg.toJson()
    );
    
    
    if (httpQuery.statusCode == 200 ){
      
      try{
        
        }catch(e){
        
        return null;
      }
  
    
  }
}

  Future editMsg(Message msg) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/editEvents.php"),
      body: msg.toJson()
    );
    
    
    if (httpQuery.statusCode == 200 ){
      
      try{
        
        }catch(e){
        
        return null;
      }
  
    
  }
}
  
  Future deleteMsg(Message msg) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/deleteEvents.php"),
      body: msg.toJson()
    );
    
    
    if (httpQuery.statusCode == 200 ){
      
      try{
        
        }catch(e){
        
        return null;
      }
  
    
  }
}
}
