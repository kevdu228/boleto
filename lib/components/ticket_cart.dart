import 'package:boleto_scan/model/buy_ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/constants.dart';

Widget priceCard (BuyTicket ticket){
  return Container(
    
   height: 100,
   width: 360,
   decoration: BoxDecoration(
              color: const Color(0xffe60023),
              borderRadius: BorderRadius.circular(20)
            ),
   child: Stack(
    children: [
      Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff30323b),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:110.0,top: 10),
                  child: Text(ticket.eventTitle,overflow: TextOverflow.ellipsis,style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:109.0,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.location_solid,color: const Color(0xffe60023).withOpacity(0.5),size: 15,),
                          Text(ticket.ticketTitle,style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12
                      ),),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.money_dollar_circle_fill,color: const Color(0xffe60023).withOpacity(0.5),size: 15,),
                          Text(Constants.formater(ticket.totalPrice.toString()),style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12
                      ),),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
          bottom:0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffe60023),
              borderRadius: BorderRadius.circular(14)
            ),
            width: 100,
            height:100,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( ticket.dateEventStart.substring(8,10),style: TextStyle(
                  color: Colors.white
                ),),
                Text(Constants.numbertoMonth[ticket.dateEventEnd.substring(5,7).toString()].toString(),style: TextStyle(
                  color: Colors.white
                ))
              ],
            ),
            ))
    ],
   ),
  );


}