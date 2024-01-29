// ignore_for_file: prefer_const_constructors

import "package:boleto_scan/screen/intro_screen.dart";
import "package:boleto_scan/screen/login.dart";
import "package:boleto_scan/screen/register.dart";
import "package:flutter/material.dart";
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _animation;
  double visible = 0;
  @override
  void initState() {
    
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      );

    _animation =  Tween<Offset>(
      begin: Offset(0,0.5),
      end:  Offset.zero).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
     _controller.forward().then((value) => setVisible());
    // _controller.reverse();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          
          // image: DecorationImage(
          //   image: AssetImage("lib/assets/splash_bg.png")
          // ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 120),

              SlideTransition(
                position: _animation,
                child: Image.asset("lib/assets/logo_boleto.png",width: 200,),
                
                ),
              Spacer(),
              
              // AnimatedOpacity(
              //   opacity: visible,
              //   duration: Duration(milliseconds: 900),

              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 40),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         boxShadow: [
              //           BoxShadow(
                            
              //               color: Colors.grey.withOpacity(0.4),
              //               blurRadius: 2,
              //               offset: Offset(0, 1)),
                
              //         ],
              //         borderRadius: BorderRadius.circular(20)
              //       ),
              //       width: double.infinity,
              //       height: 50,
              //       child: ElevatedButton(
              //       onPressed: (){
              //         Navigator.push(context,
              //          MaterialPageRoute(builder: (context)=> RegisterScreen()));
              //       },
              //       style: ButtonStyle(
              //         backgroundColor: MaterialStatePropertyAll(Colors.black),
              //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        
              //           RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(20),
                    
              //           )
              //         )
              //       ),
              //        child: Text("INSCRIPTION",style: TextStyle(
              //         color: Colors.white
              //        ),)),
              //     ),
              //     ),
              // ),
              // SizedBox(height: 30,),

              AnimatedOpacity(
                opacity: visible,
                duration: Duration(milliseconds: 900),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 2,
                            offset: Offset(0, 1)),
                
                      ],
                      borderRadius: BorderRadius.circular(20)
                    ),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context,
                       MaterialPageRoute(builder: (context)=> IntroScreen()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                    
                        )
                      )
                    ),
                     child: Text("CONTINUER",style: TextStyle(
                      color: Colors.white
                     ),)),
                  ),
                  ),
              ),

                SizedBox(height: 50,)
            ],
          ),
          ),
      ),
    );
  }
  
  setVisible() {
    setState(() {
      visible = 1.0;
    });
  }
}