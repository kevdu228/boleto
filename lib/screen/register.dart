import 'dart:convert';

import 'package:boleto_scan/components/error_bottom.dart';
import 'package:boleto_scan/controller/user_controller.dart';
import 'package:boleto_scan/model/constants.dart';
import 'package:boleto_scan/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  User use = User();
  var constants = Constants();
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mdp = TextEditingController();
  TextEditingController mdp2 = TextEditingController();

  List<bool> badInputs=[false,false,false,false,false];

  checkInputs(){
    bool emailValide = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text);
    print(emailValide);
    if(nom.text==''){
      badInputs[0]=true;
    }else{
      badInputs[0]=false;
    }

    if(prenom.text==''){
      badInputs[1]=true;
    }else{
      badInputs[1]=false;
    }

    if(email.text==''){
      badInputs[2]=true;
    }else if(!emailValide){
      badInputs[2]=true;
    }
    else{
      badInputs[2]=false;
    }

    if(mdp.text=='' || mdp.text.length < 8){
      badInputs[3]=true;
    }
    else{
      badInputs[3]= false;
    }


    if(mdp2.text=='' || mdp2.text.length < 8){
      badInputs[4]=true;
    }else if(mdp2.text!=mdp.text){
      badInputs[4]=true;
    }else
    
    {
      badInputs[4]=false;
    }

     
    bool good = true;
    for (int i=0;i<badInputs.length;i++){
      if(badInputs[1]){
        good=false;
        };
    }

    return good;


  }
  @override
  void initState() {
    final provider = Provider.of<UserController>(context,listen:false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserController>(context);
    return Consumer<UserController>(
      builder: (context,value,child)=> Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Padding(
                padding:EdgeInsets.symmetric(horizontal: 20),
                child: Text("INSCRIPTION",style: TextStyle(
                  fontSize: 20
                ),),
              ),
              const SizedBox(
                height: 40,
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
                  child:  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.supervised_user_circle_rounded),
                      hintText: "Nom"
                    ),
                    controller: nom,
                    onChanged: (value) => use.nom = nom.text,
                  ),
                ),
              ),
               badInputs[0]? Padding(
                padding:EdgeInsets.only(left: 20,top: 5),
                child: Text("* Obligatoire",style: TextStyle(
                  fontSize: 12,
                  color: Colors.red
                ),),
              ):Container(),
              const SizedBox(height: 20,),
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
                  child:  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.supervised_user_circle_rounded),
                      hintText: "Prenom"
                    ),
                    controller: prenom,
                    onChanged: (value) => use.prenom = prenom.text,
                  ),
                ),
              ),
              badInputs[1]?Padding(
                padding:EdgeInsets.only(left: 20,top: 5),
                child: Text("* Obligatoire",style: TextStyle(
                  fontSize: 12,
                  color: Colors.red
                ),),
              ):Container(),
              const SizedBox(height: 20,),
              
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
                  child:  TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email),
                      hintText: "email@email.com"
                    ),
                    controller: email,
                    onChanged: (value) => use.email = email.text,
                  ),
                ),
              ),
              badInputs[2]?Padding(
                padding:EdgeInsets.only(left: 20,top: 5),
                child: Text("* email non valide ( exemple@gmail.com )",style: TextStyle(
                  fontSize: 12,
                  color: Colors.red
                ),),
              ):Container(),
              const SizedBox(
                height: 20,
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
                  child:  TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.password),
                      hintText: "Mot de passe"
                    ),
                    controller: mdp,
                    onChanged: (value) => use.password = mdp.text,
                  ),
                ),
              ),
              badInputs[3]?Padding(
                padding:EdgeInsets.only(left: 20,top: 5),
                child: Text("* Mot de passe différents",style: TextStyle(
                  fontSize: 12,
                  color: Colors.red
                ),),
              ):Container(),
              const SizedBox(
                height: 20,
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
                  child:  TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.password),
                      hintText: "Confirmez le mot de passe"
                    ),
                    controller: mdp2,
                  ),
                ),
              ),
              badInputs[4]?Padding(
                padding:EdgeInsets.only(left: 20,top: 5),
                child: Text("* Mot de passe différents",style: TextStyle(
                  fontSize: 12,
                  color: Colors.red
                ),),
              ):Container(),
      
              
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
                      onPressed: () async {
                        checkInputs();
                        setState(() {
                          
                        });

                        // await provider.user.addUserDb(use);
                        // if(provider.user.id!=0){
                        //   var log ="{\"connected\":\"true\",\"splash\":\"false\"}";
                        //   await constants.ecricreFicher(log, "${(jsonEncode(provider.user.toJson()) )}");
                        //   Navigator.push(context,
                        //   MaterialPageRoute(builder: (context)=> const RegisterScreen()));
                        
                          
                        // }else{
                        //   print('no');
                          
                        //   errorBottom("Email indi");
                        // }
                        


                        
                      },
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(Colors.black),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                      
                          )
                        )
                      ),
                       child: const Text("INSCRIPTION ",style: TextStyle(
                        color: Colors.white
                       ),)),
                    ),
                    ),
                    
                    const SizedBox(height: 20),
                     GestureDetector(
                      onTap: () {
                      },
                       child: const Align(
                        alignment: Alignment.center,
                        child: Text("Connexion"),
                                           ),
                     ),
            ],
          ),
        ),
      ),
    );
  }
}