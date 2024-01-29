import 'dart:convert';

import 'package:boleto_scan/controller/buy_ticket_controller.dart';
import 'package:boleto_scan/controller/categorie_controller.dart';
import 'package:boleto_scan/controller/events_controller.dart';
import 'package:boleto_scan/controller/user_controller.dart';
import 'package:boleto_scan/model/user.dart';
import 'package:boleto_scan/screen/dashboard.dart';
import 'package:boleto_scan/screen/intro_screen.dart';
import 'package:boleto_scan/screen/login.dart';
import 'package:boleto_scan/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:boleto_scan/model/constants.dart';


void main()  {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  
  
  runApp(
    MultiProvider(
    providers:[
      
      ChangeNotifierProvider(
        create: (context) => UserController()
        ),
        
      ChangeNotifierProvider(
        create: (context) => EventController()
        ),

      ChangeNotifierProvider(
        create: (context)=>CategorieController()
        ),
      
      ChangeNotifierProvider(
        create: (context) => BuyTicketController()
        )

      
    ],
    child: const MyApp()
    )
    );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var constants = Constants();
  bool splash =true,connected=false,isLoading=true;

  @override
  void initState() {
    
    final provider = Provider.of<UserController>(context, listen: false);
    initDatas(provider);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserController>(context);
    return Consumer<UserController>(
      
      builder: (context,value,child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context).textTheme
            ),
            primarySwatch: Colors.blue,
          ),
          home: splash? IntroScreen():Dashboard(),
        );
      }
    ); 
  }
  
  void initDatas(UserController provider) async{
    //await constants.del();
    await constants.lireFicher();
    var data;
    var fichers = constants.files;
    if(fichers.isEmpty){

      var log ="{\"connected\":\"false\",\"splash\":\"false\"}";
      await constants.ecricreFicher(log,"");
      await constants.lireFicher();
     

    }else{

      await constants.lireFicher();
       data = json.decode(constants.files[0]) as Map<String, dynamic>;
      if(data['splash']=='false'){
        splash = false;
        
      };
      if(data['connected']!='false'){
        connected = true;
        await constants.lireFicher();
       data = json.decode(constants.files[1]) as Map<String, dynamic>;
       
        provider.user.editUser(User.fromJson(data));
        print(provider.user);
        
      };
      
       
    
    }

    isLoading =false;
    FlutterNativeSplash.remove();
    setState(() {
      
    });
  }
}




