import 'package:boleto_scan/controller/user_controller.dart';
import 'package:boleto_scan/model/constants.dart';
import 'package:boleto_scan/model/user.dart';
import 'package:boleto_scan/screen/login.dart';
import 'package:boleto_scan/screen/my_events.dart';
import 'package:boleto_scan/screen/my_profile.dart';
import 'package:boleto_scan/screen/ticket_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var constants = Constants();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(
      builder: (context, value, child)=> Container(
        color:  Colors.white,
        child: SafeArea(
          child: Scaffold(backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Mon Compte",
                          style: TextStyle(color: Color(0xff30323b),fontSize: MediaQuery.of(context).size.height < 700 ? 16:18),
                        ),
                      ]),
                ),
              ),
            ),
            body: !(value.user.id == 0)? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    value.user.nom,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height < 700 ? 18:22),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyEventsScreen()));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xff30323b).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(28)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(CupertinoIcons.bolt_horizontal),
                            const SizedBox(width: 10),
                            Text(
                              "Mes Evenements",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.height < 700 ? 14:16, color: Colors.black),
                            ),
                            const Spacer(),
                            const Icon(CupertinoIcons.arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  TicketScreen(idClt: value.user.id.toString()) ) 
                              );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xff30323b).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(28)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(CupertinoIcons.ticket),
                            const SizedBox(width: 10),
                            Text(
                              "Mes Tickets",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.height < 700 ? 14:16, color: Colors.black),
                            ),
                            const Spacer(),
                            const Icon(CupertinoIcons.arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyProfileScreen()));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xff30323b).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(28)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(CupertinoIcons.profile_circled),
                            const SizedBox(width: 10),
                            Text(
                              "Mes Informations",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.height < 700 ? 14:16, color: Colors.black),
                            ),
                            const Spacer(),
                            const Icon(CupertinoIcons.arrow_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              
                
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GestureDetector(
                    onTap: () async{
                     
                       
                       
                    
                        

                        var log = "{\"connected\":\"false\",\"splash\":\"false\"}";
                        await constants.ecricreFicher(log, "");
                        User use = User();
                        value.user.editUser(use);
                        setState(() {
                          
                        });
                        
                        
                        
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xff30323b).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(28)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.power_settings_new_outlined),
                            const SizedBox(width: 10),
                            Text(
                              "Déconnexion",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.height < 700 ? 14:16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ):Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [

                Image.asset("lib/assets/login.png",width: 300,),
                Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 40, top: 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                          
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                "Connexion",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
