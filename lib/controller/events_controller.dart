import 'package:boleto_scan/model/events.dart';
import 'package:flutter/material.dart';
import '../model/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventController extends ChangeNotifier {

  List<Event> events = [];
  bool isLoading = true;

  getEvent() async {
    
    final httpQuery =
        await http.post(Uri.parse("${Constants.urlApi}events/getEvents.php"));
    if (httpQuery.statusCode == 200) {
      List<dynamic> values = [];
      Map<String, dynamic> result = json.decode(httpQuery.body);
      values = result["event"];
      if (values.isNotEmpty) {
        events = [];
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            
            Map<String, dynamic> map = values[i];
            events.add(Event.fromJson(map));

          }
        }
        
        
        isLoading =false;
        notifyListeners();
      } else {
        return [];
      }
    }
  }
}
