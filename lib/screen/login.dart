import 'dart:convert';

import 'package:boleto_scan/components/error_bottom.dart';
import 'package:boleto_scan/controller/user_controller.dart';
import 'package:boleto_scan/model/constants.dart';
import 'package:boleto_scan/model/user.dart';
import 'package:boleto_scan/screen/dashboard.dart';
import 'package:boleto_scan/screen/register.dart';
import 'package:boleto_scan/screen/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  var constants = Constants();
  bool stayConnected = false;
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  TextEditingController email = TextEditingController();
  TextEditingController mdp = TextEditingController();
  User use = User();
  @override
  void initState() {
    final provider = Provider.of<UserController>(context, listen: false);
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation =
        Tween<Offset>(begin: const Offset(0, 10), end: const Offset(0, -1))
            .animate(CurvedAnimation(
                parent: _animationController,
                curve: Curves.fastEaseInToSlowEaseOut));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserController>(context);
    return Consumer<UserController>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "CONNEXION",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.red)),
                width: double.infinity,
                height: 50,
                child: TextField(
                  onChanged: (value) => use.email = email.text,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email),
                      hintText: "email@email.com"),
                  controller: email,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.red)),
                width: double.infinity,
                height: 50,
                child: TextField(
                  onChanged: (value) => use.password = mdp.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.password),
                      hintText: "********"),
                  controller: mdp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Colors.grey,
                    value: stayConnected,
                    onChanged: (value) {
                      stayConnected = value!;
                      setState(() {
                        
                      });
                    },
                  ),
                  const Text('Restez connectez ')
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 2,
                      offset: const Offset(0, 1)),
                ], borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      

                    

                      await provider.getUserDb(use);
                      if (provider.user.id == 0) {
                        await _animationController.forward();
                        _animationController.reverse();
                      } else {
                        var data;
                        

                          var log = !stayConnected?
                            "{\"connected\":\"false\",\"splash\":\"false\"}":
                            "{\"connected\":\"true\",\"splash\":\"false\"}";
                        
                        await constants.ecricreFicher(log, "${(jsonEncode(provider.user.toJson()) )}");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                        
                        }
                        


                        
                      }
                
                    ,
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                    child: const Text(
                      "CONNEXION",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPassword()));
                  },
                  child: const Text("Mot de passe oublie ?")),
            ),
            const SizedBox(height: 20),
             Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                },
                child: Text("Inscription")),
            ),
            const Spacer(),
            SlideTransition(
              position: _animation,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xffe60023).withOpacity(0.8)),
                    height: 50,
                    child: errorBottom("réessayez ")),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
