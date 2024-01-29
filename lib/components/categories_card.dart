import 'package:boleto_scan/model/categorie.dart';
import 'package:flutter/material.dart';

Widget categorieEvent(Categorie categorie){
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xffe60023).withOpacity(1)
      ),
      child:  Align(
        alignment: Alignment.center,
        child: Text(categorie.lib,style: TextStyle(fontSize: 20,color: Colors.white),)),
    ),
  );
}