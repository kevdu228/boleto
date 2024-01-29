import 'package:boleto_scan/components/categories_card.dart';
import 'package:boleto_scan/components/event_card.dart';
import 'package:boleto_scan/components/horizontal_event_card.dart';
import 'package:boleto_scan/controller/categorie_controller.dart';
import 'package:boleto_scan/controller/events_controller.dart';
import 'package:boleto_scan/model/categorie.dart';
import 'package:boleto_scan/model/constants.dart';
import 'package:boleto_scan/model/events.dart';
import 'package:boleto_scan/screen/categorie_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool search = false;
  TextEditingController searchControl = TextEditingController();
  @override
  void initState() {
    final provider = Provider.of<CategorieController>(context,listen:false);
    final providerEvents = Provider.of<EventController>(context,listen:false);

    provider.getCategories();
    providerEvents.getEvent();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategorieController>(context);
    final providerEvents = Provider.of<EventController>(context);
    return Consumer<CategorieController>(
        
        builder:(context,value,child)=> Container(
        color:  Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar:PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                  child: Row(
                    
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      const Text("",style: TextStyle(fontSize: 18),),
                      Text("Catégories",style: TextStyle(fontSize: MediaQuery.of(context).size.height < 700 ? 16:18,color: Color(0xff30323b)),),
                      
                      const Text("",style: TextStyle(fontSize: 18),),
                    ]),
                ),
              ),),
          
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Trouvez un evenemnet ",style: TextStyle(fontSize: MediaQuery.of(context).size.height < 700 ? 16:18),),
                      ],
                    ),
                    
                    ),
                          
                  //   Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Container(
                  //     decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
                  //     border: Border.all(
                  //       color: Colors.red
                  //     )
                      
                  //     ),
                      
                  //     width: double.infinity,
                  //     height:  MediaQuery.of(context).size.height < 700 ?45:50,
                  //     child: TextField(
                  //       onChanged: (value) {
                  //         if(value.isNotEmpty){
                  //           setState(() {
                  //             search = true;
                  //           });
                  //         }else{
                  //           setState(() {
                  //             search = false;
                  //           });
                  //         }
                  //       },
                  //       controller: searchControl,
                  //       decoration: const InputDecoration(
                  //         border: InputBorder.none,
                  //         prefixIcon: Icon(CupertinoIcons.search),
                  //         hintText: ""
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                          
                  !search?Container(
                    height: double.parse(( (100 + 30) * provider.categorie.length).toString()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: !provider.isLoading? GridView.builder(
                        itemCount: provider.categorie.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 100,
                            mainAxisSpacing: 20,
                            crossAxisCount:  2 ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                            changePage(context,provider.categorie[index],providerEvents.events);
                            
                            },
                            child: categorieEvent(provider.categorie[index]));
                        },
                      ):Container(),
                    ),
                  ):Container(
                    height:double.parse(( (200 + 30) * provider.categorie.length).toString()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                            //   Navigator.push(context,
                            //  MaterialPageRoute(builder: (context)=> CategorieScreen(title: "Categorie",)));
                            
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              height: 200,
                              child: horizontalEventCard(providerEvents.events[0])));
                        },
                      ),
                    ),
                  )
                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }
  
  void changePage(BuildContext context,Categorie cat,List<Event> evenements) {
    List<Event> event=[];
    for(int i =0;i<evenements.length;i++){
      if(int.parse(evenements[i].category) == cat.id){
        event.add(evenements[i]);
      }
    }
    Navigator.push(context,
                             MaterialPageRoute(builder: (context)=> CategorieScreen(title: cat.lib,event: event,)));
    
  }
}