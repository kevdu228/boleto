import 'package:boleto_scan/components/event_card.dart';
import 'package:boleto_scan/components/ticket_cart.dart';
import 'package:boleto_scan/controller/buy_ticket_controller.dart';
import 'package:boleto_scan/screen/my_ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketScreen extends StatefulWidget {
  final String idClt;
  const TicketScreen({super.key,required this.idClt});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  void initState() {
    final provider =Provider.of<BuyTicketController>(context,listen: false);
    provider.getBuyTicket(this.widget.idClt);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider =Provider.of<BuyTicketController>(context);
    return Consumer<BuyTicketController>(
      builder: (context,value,child) {
        return Container(
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
                          "Mes tickets",
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
                     height: (110 * provider.sales.length).toDouble(),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: provider.sales.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: const BoxDecoration(
                              
                            ),
                            height: 100,
                            width: 360,
                            margin: const EdgeInsets.only(top: 10,right: 20,left: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                             MaterialPageRoute(builder: (context)=>  MyTicket(ticket: provider.sales[index])));
                              },
                              child: priceCard(provider.sales[index])));
                        },),
                    ),
            ),
            
            ),
        );
      }
    );
  }
}