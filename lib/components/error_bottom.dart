import 'package:flutter/material.dart';

Widget errorBottom(text){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.warning,color: Colors.amber,),
        
        Text(text,style: const TextStyle(
                fontSize: 16,
                color: Colors.white
              ),),
        const Icon(Icons.warning,color: Colors.transparent,),
      ],
    ),
  );
}