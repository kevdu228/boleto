import 'package:boleto_scan/components/event_card.dart';
import 'package:boleto_scan/model/events.dart';
import 'package:boleto_scan/screen/event_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorieScreen extends StatefulWidget {
  final String title;
  final List<Event> event;
  const CategorieScreen({super.key,required this.title,required this.event});

  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar:PreferredSize(
              
              preferredSize: const Size.fromHeight(60),
              
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20,top: 5,bottom: 5),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          CupertinoIcons.back,
                          size: 30,
                        ),
                      ),
                      Text(
                      widget.title,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Icon(
                        CupertinoIcons.back,
                        size: 30,
                        color: Colors.transparent,
                      ),
                    ]),
              ),
            ),
          body: SizedBox(
               height: double.parse((300 * widget.event.length).toString()),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.event.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                        
                      ),
                      height: 250,
                      
                      margin: EdgeInsets.only(top: 10,right: 20,left: 20,bottom: index == widget.event.length-1?20:0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                       MaterialPageRoute(builder: (context)=> EventDetailScreen(event: widget.event[index],)));
                        },
                        child: eventCard(context,widget.event[index])));
                  },),
              ),
        )
        ),
    );
  }
}