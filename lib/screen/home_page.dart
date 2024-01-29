import 'package:boleto_scan/components/event_card.dart';
import 'package:boleto_scan/components/horizontal_event_card.dart';
import 'package:boleto_scan/controller/events_controller.dart';
import 'package:boleto_scan/model/events.dart';
import 'package:boleto_scan/screen/categorie_detail.dart';
import 'package:boleto_scan/screen/event_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boleto_scan/model/constants.dart' ;
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Event> events=[];
  Event event = Event();
  ScrollController scrollController = new ScrollController();
  TextEditingController recherche = TextEditingController();
  bool search=false;
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider =  Provider.of<EventController>(context,listen: false);
    provider.getEvent(); 
   

   
  }

  
  
  @override
  Widget build(BuildContext context) {
    final providerEvent =  Provider.of<EventController>(context);
    return Consumer<EventController>(
      
      builder: (context, value, child) => Container(
        color:  Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar:  PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                height: 60,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: Row(
                    
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      
                      Expanded(
                        child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Container(
                                          decoration:BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius: BorderRadius.circular(20),
                                          ),
                                          
                                          
                                          height:  40,
                                          child: TextField(
                                            controller: recherche,
                        onChanged: (value) {
                          search = true;
                          if(value.length==1){
                            scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
                          }else 
                          if(value.isEmpty){
                            search = false;
                            
                          }
                          setState(() {
                            
                          });
                          
                        },
                        
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(
                            onTap: (){
                              recherche.text='';
                              search=false;
                  
                              setState(() {
                                
                              });
                            },
                            child: Icon(CupertinoIcons.delete,color: search?Color(0xffe60023):Colors.transparent,size: 20,)),
                          prefixIcon: Icon(CupertinoIcons.search,color: Color(0xff30323b),size: 20,),
                          hintText: "Trouvez un évènement"
                        ),
                                          ),
                                        ),
                                      ),
                      ),
                    ]),
                ),
              ),),
            body: providerEvent.isLoading? 
              Center(
                child: LoadingAnimationWidget .horizontalRotatingDots(
                      color: Color(0xffe60023),
                      size:  50,
                    ),
              ):SingleChildScrollView(
              controller: scrollController,
              child: 
    
    !search? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Top events",style: TextStyle(fontSize: 16),),
                        GestureDetector(
                          onTap: (){
                          Navigator.push(context,
                             MaterialPageRoute(builder: (context)=> CategorieScreen(title: "Top events",event: providerEvent.events,)));
                          
                          },
                          child: const Text("Voir plus",style: TextStyle(fontSize: 16,color: Color(0xffe60023)),)),
                      ],
                    ),
                    
                    ),
              
                    Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                    
                    child:  !providerEvent.isLoading?SizedBox(
      
                        
                        height:  MediaQuery.of(context).size.height < 700 ?Constants.heightSm:Constants.heightLg,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: providerEvent.events.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(left: 20,right: index == providerEvent.events.length-1?20:0 ),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                             MaterialPageRoute(builder: (context)=> EventDetailScreen(event:providerEvent.events[index],)));
                                },
                                child: eventCard(context,providerEvent.events[index])));
                          },),
                      ):Container(),
                      
                      
                     
                      
                    ),
              
                    Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Top events",style: TextStyle(fontSize: 16),),
                        GestureDetector(
                          onTap: (){
                          Navigator.push(context,
                             MaterialPageRoute(builder: (context)=> CategorieScreen(title: "Top events",event: providerEvent.events,)));
                          
                          },
                          child: const Text("Voir plus",style: TextStyle(fontSize: 16,color: Color(0xffe60023)),)),
                      ],
                    ),
                    
                    ),
              
                    Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                    
                    child:  !providerEvent.isLoading?SizedBox(
      
                        
                        height:  MediaQuery.of(context).size.height < 700 ?Constants.heightSm:Constants.heightLg,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: providerEvent.events.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(left: 20,right: index == providerEvent.events.length-1?20:0 ),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                             MaterialPageRoute(builder: (context)=> EventDetailScreen(event:providerEvent.events[index],)));
                                },
                                child: eventCard(context,providerEvent.events[index])));
                          },),
                      ):Container(),
                      
                      
                     
                      
                    ),
              
                    Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Top events",style: TextStyle(fontSize: 16),),
                        GestureDetector(
                          onTap: (){
                          Navigator.push(context,
                             MaterialPageRoute(builder: (context)=> CategorieScreen(title: "Top events",event: providerEvent.events,)));
                          
                           },
                          child: const Text("Voir plus",style: TextStyle(fontSize: 16,color: Color(0xffe60023)),)),
                      ],
                    ),
                    
                    ),
              
              
                    
              
                    SizedBox(
                     height: double.parse((120 * providerEvent.events.length).toString()),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: providerEvent.events.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: const BoxDecoration(
                              
                            ),
                            height: 100,
                            width: 360,
                            margin: const EdgeInsets.only(top: 10,right: 20,left: 20),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                             MaterialPageRoute(builder: (context)=> EventDetailScreen(event:providerEvent.events[index],)));
                              },
                              child: horizontalEventCard(providerEvent.events[index])));
                        },),
                    ),
              
                ],
              ):Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Resutats pour : \" ${recherche.text} \" ",style: const TextStyle(fontSize: 18),),
                        GestureDetector(
                          onTap: ()async{
                          //   Navigator.push(context,
                          //  MaterialPageRoute(builder: (context)=> CategorieScreen(title: "Top events",)));
                          
                          },
                          child: const Text("",style: TextStyle(fontSize: 12,color: Color(0xffe60023)),)),
                      ],
                    ),
                    
                    ),
    
                  SizedBox(
                    
                        height: double.parse((((MediaQuery.of(context).size.height < 700 ?Constants.heightSm:Constants.heightLg) + 30) * providerEvent.events.length).toString()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: providerEvent.events.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                Navigator.push(context,
                             MaterialPageRoute(builder: (context)=> EventDetailScreen(event:providerEvent.events[index],)));
                                },
                                child: Container(
                                  margin:  EdgeInsets.only(bottom:  20,top: index == 0?20:0 ),
                                  height: MediaQuery.of(context).size.height < 700 ?Constants.heightSm:Constants.heightLg,
                                  child: eventCard(context,providerEvent.events[index])));
                            },
                          ),
                        ),
                      ),
                      
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
  
  
}