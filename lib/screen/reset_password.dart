// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  int page =0;
  Widget pageZero(){
      return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Padding(
                  padding:EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Mot de passe oublie ",style: TextStyle(
                    fontSize: 20
                  ),),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding:EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Entrez votre adresse email"),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.red
                    )
                    
                    ),
                    
                    width: double.infinity,
                    height: 50,
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email),
                        hintText: "email@email.com"
                      ),
                    ),
                  ),
                ),
            
                
            
                const SizedBox(height: 40),
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
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
                           
                            setState(() {
                            page =1;
                          });
                           
                        },
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                        
                            )
                          )
                        ),
                         child: const Text("CONTINUER ",style: TextStyle(
                          color: Colors.white
                         ),)),
                      ),
                      ),
                      
              ],
            );
    }
  Widget pageOne(){
      return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Padding(
                  padding:EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Mot de passe oublie ",style: TextStyle(
                    fontSize: 20
                  ),),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding:EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Entrez le mot envoye a l'adresse \nemail@email.com "),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.red
                    )
                    
                    ),
                    
                    width: double.infinity,
                    height: 50,
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.password),
                        hintText: "********"
                      ),
                    ),
                  ),
                ),
            
                
            
                const SizedBox(height: 40),
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
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
                           
                            setState(() {
                            page =2;
                          });
                           
                        },
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                        
                            )
                          )
                        ),
                         child: const Text("CONTINUER ",style: TextStyle(
                          color: Colors.white
                         ),)),
                      ),
                      ),
                      
              ],
            );
    }

    Widget pageTwo(){
      return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Padding(
                  padding:EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Mot de passe oublie ",style: const TextStyle(
                    fontSize: 20
                  ),),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding:EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Entrez le nouveau mot de passe"),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.red
                    )
                    
                    ),
                    
                    width: double.infinity,
                    height: 50,
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.password),
                        hintText: "********"
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.red
                    )
                    
                    ),
                    
                    width: double.infinity,
                    height: 50,
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.password),
                        hintText: "********"
                      ),
                    ),
                  ),
                ),
            
                
            
                const SizedBox(height: 40),
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
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
                          setState(() {
                            page =0;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                        
                            )
                          )
                        ),
                         child: const Text("CONTINUER ",style: TextStyle(
                          color: Colors.white
                         ),)),
                      ),
                      ),
                      
              ],
            ); 
    }
  @override
  Widget build(BuildContext context) {
    

    
    return Scaffold(
      body: SingleChildScrollView(
        child: 
        IndexedStack(
          index: page,
          children: [
            pageZero(),
            pageOne(),
            pageTwo()
          ],
        ),
      ),
    );
  }
}