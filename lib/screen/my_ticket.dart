import 'package:boleto_scan/controller/buy_ticket_controller.dart';
import 'package:boleto_scan/model/buy_ticket.dart';
import 'package:boleto_scan/model/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';

class MyTicket extends StatefulWidget {
  final BuyTicket ticket;
  const MyTicket({super.key,required this.ticket});

  @override
  State<MyTicket> createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket> {
  @override
  void initState() {
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  
    return  Container(
        color: Colors.white,
        child: SafeArea(
          child:Scaffold(
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
                        "",
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
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10,top: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
              
                        Opacity(
                          opacity: 0.15,
                          child: Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage('lib/assets/event.webp'),
                                fit: BoxFit.cover),
                          ),
                                                ),
                        ),
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: PrettyQrView.data(
                          data: this.widget.ticket.reference,
                          decoration: const PrettyQrDecoration(
                            image: PrettyQrDecorationImage(
                              image: AssetImage('lib/assets/logo_boleto.png'),
                            ),
                          ),
                                                  ),
                        ),
                        
                      ],
                      
                    ),
                  ),
              
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Text('Evenement',style: TextStyle(fontSize: 16),),
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Text(this.widget.ticket.eventTitle,style: TextStyle(fontSize: 20,color: Color(0xffe60023)),),
                  ),

                  
                   

                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                    padding: EdgeInsets.only( right: 20, bottom: 10),
                    child: Text('Ticket',style: TextStyle(fontSize: 16),),
                  ),
                        Text('Prix',style: TextStyle(fontSize: 16),),
              
                      ],
                    ),
                  ),

                   Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(this.widget.ticket.ticketTitle,style: TextStyle(fontSize: 16,color: Color(0xffe60023)),),
                  
                        Text(Constants.formater(this.widget.ticket.unitPrice.toString()),style: TextStyle(fontSize: 16,color: Color(0xffe60023)),),
              
                      ],
                    ),
                  ),
              
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Date',style: TextStyle(fontSize: 16),),
                        Text('Heure',style: TextStyle(fontSize: 16),),
              
                      ],
                    ),
                  ),

                   Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(this.widget.ticket.dateEventStart.substring(0,10),style: TextStyle(fontSize: 16,color: Color(0xffe60023)),),
                        Text(this.widget.ticket.dateEventStart.substring(11,16),style: TextStyle(fontSize: 16,color: Color(0xffe60023)),),
              
                      ],
                    ),
                  ),
              
                   
              
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  //   child: Text('Prix du ticket',style: TextStyle(fontSize: 16),),
                  // ),
                  //  Padding(
                  //   padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  //   child: Text(Constants.numbertoMonth[this.widget.ticket.unitPrice.toString().substring(5,7)].toString(),style: TextStyle(fontSize: 16,color: Color(0xffe60023)),),
                  // ),
              
              
                ],
              ),
          
          ),
      )
      );
    
  }
}