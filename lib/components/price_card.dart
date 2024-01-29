import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boleto_scan/model/ticket.dart';

Widget priceCard(String selected,textSize,Ticket ticket){
  return Container(
    
    margin: const EdgeInsets.only(left: 20,),
    decoration: BoxDecoration(
      color: selected == ticket.title?const Color(0xffe60023).withOpacity(0.1):const Color(0xff30323b).withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      
          selected == ticket.title?const Icon(CupertinoIcons.tickets_fill,color: Color(0xffe60023),size: 15):const Icon(CupertinoIcons.tickets_fill,color: Color(0xff30323b),size: 15),
          const SizedBox(width: 20),
          Text(ticket.title,style: TextStyle(fontSize: textSize,color: Colors.black),),
          
      
      
        ],
      ),
    ),
  );
}