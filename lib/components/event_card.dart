import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boleto_scan/model/constants.dart' ;
import 'package:boleto_scan/model/events.dart' ;




Widget eventCard(context,Event event){
  return Container(
    
    height: 0,
    width: MediaQuery.of(context).size.width < 400 ?Constants.widthSm:Constants.widthLg,
    decoration: BoxDecoration(
      color:  Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Stack(
      children: [
        Container(
          width:380,
          decoration: BoxDecoration(
            image: const DecorationImage(image: AssetImage('lib/assets/event.webp'),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff30323b),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 5),
                  child: Text(event.title,style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.location_solid,color: const Color(0xffe60023).withOpacity(1),size: 15,),
                          const SizedBox(width: 5),
                          Text(event.address,style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12
                      ),),
                        ],
                      ),
                      const SizedBox(height: 5),
                      
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.money_dollar_circle_fill,color: const Color(0xffe60023).withOpacity(1),size: 15,),
                          const SizedBox(width: 5),
                          Text(Constants.formater(event.tickets[0].price.toString()),style: const TextStyle(
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
        ),
        Positioned(
          bottom:50,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffe60023),
              borderRadius: BorderRadius.circular(14)
            ),
            width: 60,
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( event.startDate.substring(8,10),style: const TextStyle(
                  color: Colors.white
                ),),
                Text(Constants.numbertoMonth[event.startDate.substring(5,7).toString()].toString(),style: const TextStyle(
                  color: Colors.white
                ))
              ],
            ),
            ))

      ],
    ),
    

  );
}



