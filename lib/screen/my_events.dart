import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({super.key});

  @override
  State<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              
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
                      const Text(
                      "Mes Evenemets",
                      style: TextStyle(fontSize: 18),
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
               height: 1060,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.vertical,
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                        
                      ),
                      height: 100,
                      width: 360,
                      margin: const EdgeInsets.only(top: 10,right: 20,left: 20),
                      child: const Text(''));
                  },),
              ),
        ),
        
      ),
    );
  }
}