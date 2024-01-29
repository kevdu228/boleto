import 'dart:convert';

import 'package:boleto_scan/model/buy_ticket.dart';
import 'package:boleto_scan/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class BuyTicketController extends ChangeNotifier{
  bool isLoading = false;
  //BuyTicket sale=BuyTicket(dateAdded: '', dateEventStart: '', dateEventEnd: '', eventTitle: '', ticketTitle: '', unitPrice: 0, totalPrice: 0, quantity: 0, userId: 0, eventId: 0);
  List<BuyTicket> sales=[];

  getBuyTicket(id) async {
    final httpQuery =
        await http.post(Uri.parse("${Constants.urlApi}buyTickets/getBuyTicket.php"),body: {'id':id});
    if (httpQuery.statusCode == 200) {
      List<dynamic> values = [];
      
      Map<String, dynamic> result = json.decode(httpQuery.body);
      values = result["buyTicket"];
      if (values.isNotEmpty) {
        sales = [];
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            
            Map<String, dynamic> map = values[i];
            sales.add(BuyTicket.fromJson(map));

          }
        }
        
        
        isLoading =false;
        notifyListeners();
      } else {
        return [];
      }
    }
}
  
   addBuyTicket(BuyTicket ticket) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}buyTickets/addBuyTicket.php"),
      body: ticket.toJson()
    );
    
    
    if (httpQuery.statusCode == 200 ){
      print(httpQuery.body);
      Map<String, dynamic> result = json.decode(httpQuery.body);
      ticket = BuyTicket.fromJson(result["buyTicket"]) ;
      
  
    
  }else{
    print('no');
  }
}
}