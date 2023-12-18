import 'package:flutter/material.dart';

import 'class/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    ); 
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double paddingDefault = 20;
  User kev = User(id: 0, nom: "nom", prenom: "prenom", password: "password", email: "email", reference: "reference", dateNaissance: DateTime.now(), dateCreation: DateTime.now(), etat: true, gcu: false, ville: "ville", pays: "pays", adresse: "adresse", telephone: "telephone", photoProfil: "photoProfil", photoBack: "photoBack", titreRole: "titreRole", about: "about");

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
      
        preferredSize: Size.fromHeight(80),
        
        child: Padding(
          padding:  EdgeInsets.all(paddingDefault),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                      'Welcome Back  !',
                      ),
                      Text(
                  'kevin  bedinade',
                  ),
                    ],
                  ),


                ],
              ),

              CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.amber..shade100,
                  )
              
              
            ],
          ),
        ),
      ),
      
      body: Center(
        
        child: Column(
           
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
