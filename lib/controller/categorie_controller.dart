import 'package:boleto_scan/model/categorie.dart';
import 'package:flutter/material.dart';
import '../model/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategorieController extends ChangeNotifier{

  bool isLoading = true;
  List<Categorie> categorie = [];

  getCategories() async {
    final httpQuery =
        await http.post(Uri.parse("${Constants.urlApi}categories/getCategories.php"));
    if (httpQuery.statusCode == 200) {
      List<dynamic> values = [];
      Map<String, dynamic> result = json.decode(httpQuery.body);
      values = result["categories"];
      if (values.isNotEmpty) {
        categorie = [];
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            categorie.add(Categorie.fromJson(map));

          }
        }
        //print(categorie.length);
        
        isLoading =false;
        notifyListeners();
      } else {
        return [];
      }
    }
  }

}