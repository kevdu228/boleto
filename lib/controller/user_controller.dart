import 'package:boleto_scan/model/user.dart';
import 'package:flutter/material.dart';
import '../model/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UserController extends ChangeNotifier{
  bool isLoading = false;
  User user=User();

  
  getUserDb(User use) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/getUser.php")
      ,body: use.toJson()
    );
    User userTemp = User(
              );
    
    if (httpQuery.statusCode == 200 ){
      print(use.email);
      print(httpQuery.body);
      
      try{
        
        userTemp = User.fromJson( json.decode(httpQuery.body)["data"][0] as Map<String, dynamic> );
        userTemp.setId = int.parse(jsonDecode(httpQuery.body)["data"][0]["iduser"]);  
        user.editUser(userTemp); 
        
        notifyListeners();
        
        }catch(e){
        
        return 'nothing here';
      }
  
    
  }
}
}