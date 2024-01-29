import 'package:boleto_scan/model/constants.dart';
import 'package:boleto_scan/model/user.dart';
import 'package:http/http.dart' as http;

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

  // Factory constructor to create a Liker object from a json (e.g., from database query)
  factory Liker.fromJson(Map<String, dynamic> json) {
    return Liker(
      id: json['idliker'],
      dateLiked: DateTime.parse(json['dateliker']),
      eventId: json['ideventliker'],
      userId: json['iduserliker'],
    );
  }

  // Convert the Liker object to a json for database operations
  Map<String, dynamic> toJson() {
    return {
      'idliker': id,
      'dateliker': dateLiked.toIso8601String(),
      'ideventliker': eventId,
      'iduserliker': userId,
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
  
  Future addMsg(Liker like) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/addEvents.php"),
      body: like.toJson()
    );
    
    
    if (httpQuery.statusCode == 200 ){
      
      try{
        
        }catch(e){
        
        return null;
      }
  
    
  }
}

  Future editMsg(Liker like) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/editEvents.php"),
      body: like.toJson()
    );
    
    
    if (httpQuery.statusCode == 200 ){
      
      try{
        
        }catch(e){
        
        return null;
      }
  
    
  }
}
  
  Future deleteLike(Liker like) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/deleteEvents.php"),
      body: like.toJson()
    );
    
    
    if (httpQuery.statusCode == 200 ){
      
      try{
        
        }catch(e){
        
        return null;
      }
  
    
  }
}
}
