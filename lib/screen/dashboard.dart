import 'package:boleto_scan/model/events.dart';
import 'package:boleto_scan/screen/categories_event.dart';
import 'package:boleto_scan/screen/home_page.dart';
import 'package:boleto_scan/screen/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Event event = Event();

  int indexPage = 0;
  changePage(index){
    setState(() {
      indexPage = index;
      //event.getEvent();
    });
  }
  @override
  void initState() {
    
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: indexPage,
        children: const [
          HomeScreen(),
          CategoriesScreen(),
          UserScreen()
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(useMaterial3: false),
        child: BottomAppBar(
          height:55,
          color: Colors.white,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               GestureDetector(
                onTap: (){
                  changePage(0);
                  
                  },
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(CupertinoIcons.home,color: indexPage==0? Colors.red:Colors.black,),
                     Text("Acceuil",style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height < 700 ?8:10,
                      color: indexPage==0? Colors.red:Colors.black
                     ),)
                   ],
                 ),
               ),
              GestureDetector(
                onTap: (() => changePage(1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(CupertinoIcons.list_dash,color: indexPage==1? Colors.red:Colors.black),
                     Text("Categories",style: TextStyle(
                      fontSize:  MediaQuery.of(context).size.height < 700 ?8:10,
                      color: indexPage==1? Colors.red:Colors.black
                     ),)
                   ],
                 ),
              ),
              GestureDetector(
                onTap: (() => changePage(2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(CupertinoIcons.profile_circled,color: indexPage==2? Colors.red:Colors.black),
                     Text("Compte",style: TextStyle(
                      fontSize:  MediaQuery.of(context).size.height < 700 ?8:10,
                      color: indexPage==2? Colors.red:Colors.black
                     ),)
                   ],
                 ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}