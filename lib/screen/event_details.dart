import 'package:boleto_scan/components/price_card.dart';
import 'package:boleto_scan/controller/buy_ticket_controller.dart';
import 'package:boleto_scan/controller/user_controller.dart';
import 'package:boleto_scan/model/buy_ticket.dart';
import 'package:boleto_scan/model/events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:boleto_scan/model/constants.dart' ;
import 'package:provider/provider.dart';

class EventDetailScreen extends StatefulWidget {
  Event event;
  EventDetailScreen({super.key,required this.event});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  int selectedTicket = 0 ,qte = 1;
  ajouter(signe){
    if(signe=='+'){
      qte++;
    }else{
      if(qte!=1){
        qte--;
      }
    }

  }
  @override
  void initState() {
    final providerUser = Provider.of<UserController>(context,listen: false);
    final providerBuy = Provider.of<BuyTicketController>(context,listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<UserController>(context);
    final providerBuy = Provider.of<BuyTicketController>(context);
    return Consumer<UserController>(
      builder:(context,value,child)=> Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
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
                        Text(
                        widget.event.title,
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height < 700 ? 16:18),
                      ),
                      const Icon(
                          CupertinoIcons.back,
                          size: 30,
                          color: Colors.transparent,
                        ),
                      ]),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 20,top: 20),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height < 700 ?Constants.heightSm:Constants.heightLg,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage('lib/assets/event.webp'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                widget.event.about,
                                textAlign: TextAlign.justify,style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height < 700 ? 14:16
                                ),),
                                
                          ],
                        ),
                      ),
                    ),
                    Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          
          
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              children: [
                Row(
                  children: [
                    const Icon(CupertinoIcons.calendar,color: Color(0xff30323b),size: 14),
                    const SizedBox(
                  width: 10,
                ),
                    Text(widget.event.startDate.substring(0,10),style: TextStyle(fontSize: MediaQuery.of(context).size.height < 700 ? 12:14,color: const Color(0xff30323b)),),
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                Row(
                  children: [
                    Icon(CupertinoIcons.time_solid,color: const Color(0xff30323b),size: MediaQuery.of(context).size.height < 700 ? 12:14),
                    const SizedBox(
                  width: 10,
                ),
                    Text(widget.event.startDate.substring(11,16),style: const TextStyle(fontSize: 12,color: Color(0xff30323b)),),
                  ],
                ),
              ],
            ),
          )
          
          
              ],
            ),
            
          
          
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 20,top: 10),
                      child: Text(
                        "Prix",
                        style: TextStyle(fontSize:  MediaQuery.of(context).size.height < 700 ? 14:16, color: const Color(0xffe60023)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 38,
                          child: ListView.builder(
                            itemCount: widget.event.tickets.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) => GestureDetector(
                              onTap: () {
                                selectedTicket = index;
                                setState(() {
                                  
                                });
                              },
                              child: priceCard(widget.event.tickets[selectedTicket].title, MediaQuery.of(context).size.height < 700 ? 12.0:14.0,widget.event.tickets[index]) )  ),
                            physics: const BouncingScrollPhysics(),
                            
                          ),
                        ),
                        const SizedBox(height: 20),
                    
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
          
                              Text(Constants.formater(
                          (double.parse(widget.event.tickets[selectedTicket].price.toString())*qte).toString()),
                          style: TextStyle(fontSize:MediaQuery.of(context).size.height < 700 ? 14.0:16.0 ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                      padding:
                          const EdgeInsets.only( right: 20, bottom: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                widget.event.tickets[selectedTicket].about,
                                textAlign: TextAlign.justify,style: TextStyle(
                                  color: const Color(0xff30323b).withOpacity(0.8),
                                  fontSize: MediaQuery.of(context).size.height < 700 ? 14:16
                                ),),
                                
                          ],
                        ),
                      ),
                    ),
          
                              Container(
                                
                                            width: 120,
                                            height: 38,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff30323b).withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(28)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      ajouter('-');
                                                      setState(() {
                                                        
                                                      });
                                                    },
                                                    child: const Icon(CupertinoIcons.minus)),
                                                  Text(
                                                    qte.toString(),
                                                    style: const TextStyle(fontSize: 16, color: Colors.black),
                                                  ),
                                                
                                                  GestureDetector(
                                                    onTap: () {
                                                      ajouter('+');
                                                      setState(() {
                                                        
                                                      });
                                                    },
                                                    child: const Icon(CupertinoIcons.add)),
                                              
                                                ],
                                              ),
                                            ),
                                          ),
                            ],
                          ),
                        )
                      ],
                    ),
                        
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 20, right: 20, bottom: 20,top: 10),
                      child: Text(
                        "Location",
                        style: TextStyle(fontSize: 16, color: Color(0xffe60023)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Container(
                        width: 360,
                        height: MediaQuery.of(context).size.height < 700 ?Constants.heightSm:Constants.heightLg,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          // image: DecorationImage(
                          //     image: AssetImage('lib/assets/event.webp'),
                          //     fit: BoxFit.cover),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            heightFactor: 0.3,
                            widthFactor: 2.5,
                            child: GoogleMap(
                              myLocationButtonEnabled: false,
                              initialCameraPosition: CameraPosition(
                                target:  LatLng(double.parse(widget.event.mapLatitude), double.parse(widget.event.mapLongitude)),
                                zoom: 11.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
          
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40,top: 20),
                      child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  
                                  color: Colors.grey.withOpacity(0.4),
                                  blurRadius: 2,
                                  offset: const Offset(0, 1)),
                      
                            ],
                            borderRadius: BorderRadius.circular(20)
                          ),
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                          onPressed: (){
                            BuyTicket sale = BuyTicket(
                              dateAdded: DateTime.now().toString(),
                               dateEventStart: this.widget.event.startDate,
                                dateEventEnd: this.widget.event.startDate,
                                 eventTitle: this.widget.event.title,
                                  ticketTitle: widget.event.tickets[selectedTicket].title,
                                   unitPrice: widget.event.tickets[selectedTicket].price,
                                   totalPrice:  widget.event.tickets[selectedTicket].price * qte.toDouble(),
                                    quantity: qte,
                                    userId: providerUser.user.id,
                                    eventId: widget.event.id);
                                    
                                    providerBuy.addBuyTicket(sale);
                            // Navigator.push(context,
                            //  MaterialPageRoute(builder: (context)=> Dashboard()));
                          },
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(Colors.black),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                          
                              )
                            )
                          ),
                           child: const Text("PAYEZ ",style: TextStyle(
                            color: Colors.white
                           ),)),
                        ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
