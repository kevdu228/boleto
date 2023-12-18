import 'dart:math';

import 'constants.dart' ;
import 'package:http/http.dart' as http;
import 'dart:convert';
class User {
  int id;
  String nom , prenom , password , email , reference;
  DateTime dateNaissance , dateCreation;
  bool etat , gcu;
  String ville, pays,adresse, telephone,photoProfil,photoBack,titreRole, about;

  User({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.password,
    required this.email,
    required this.reference,
    required this.dateNaissance,
    required this.dateCreation,
    required this.etat,
    required this.gcu,
    required this.ville,
    required this.pays,
    required this.adresse,
    required this.telephone,
    required this.photoProfil,
    required this.photoBack,
    required this.titreRole,
    required this.about,
  });

  

  // Factory constructor to create a User object from a jsonData (e.g., from database query)
  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
      id: int.parse(jsonData['iduser']),
      nom: jsonData['nomuser'],
      prenom: jsonData['prenomuser'],
      password: jsonData['passworduser'],
      email: jsonData['emailuser'],
      reference: jsonData['referanceuser'],
      dateNaissance: DateTime.parse(jsonData['datenaisseuser']),
      dateCreation: DateTime.parse(jsonData['datecreateuser']),
      etat: jsonData['etatuser'] == 1,
      gcu: jsonData['gcuuser'] == 1,
      ville: jsonData['villeuser'],
      pays: jsonData['paysuser'],
      adresse: jsonData['adresseuser'],
      telephone: jsonData['telephoneuser'],
      photoProfil: jsonData['photoprofiluser'],
      photoBack: jsonData['photobackuser'],
      titreRole: jsonData['titrerole'],
      about: jsonData['aboutuser'],
    );
  }

  String toString(){
    return "id : ${this.id} , nom : ${this.nom} , email : ${this.email}";
  }



  // Convert the User object to a jsonData for database operations
  Map<String, String> toJson() {
    return {
      'iduser': id.toString(),
      'nomuser': nom,
      'prenomuser': prenom,
      'passworduser': password,
      'emailuser': email,
      'referanceuser': reference,
      'datenaisseuser': dateNaissance.toString(),
      'datecreateuser': dateCreation.toString(),
      'etatuser': etat ? "1" : "0",
      'gcuuser': gcu ?"1" : "0",
      'villeuser': ville,
      'paysuser': pays,
      'adresseuser': adresse,
      'telephoneuser': telephone,
      'photoprofiluser': photoProfil,
      'photobackuser': photoBack,
      'titrerole': titreRole,
      'aboutuser': about,
    };
  }

   addUserDb(User user) async {
    final httpQuery = await http.post(
      Uri.parse(Constants.urlApi+"addUser.php"),
      body: user.toJson()

    );
    User userTemp = User(
              id: 666,
              nom: "nom",
              prenom: "prenom",
              password: "password",
              email: Random().nextInt(100).toString(),
              reference: Random().nextInt(100).toString(),
              dateNaissance: DateTime.now(),
              dateCreation: DateTime.now(),
              etat: true,
              gcu: false,
              ville: "ville",
              pays: "pays",
              adresse: "adresse",
              telephone: "telephone",
              photoProfil: "photoProfil",
              photoBack: "photoBack",
              titreRole: "titreRole",
              about: "about"
              );
    
    if (httpQuery.statusCode == 200){
      try{
       userTemp = User.fromJson(json.decode(httpQuery.body)["data"]);

      }catch(e){
        print(json.decode(httpQuery.body)["msg"]);
      
      }
      return userTemp;
    }
    return userTemp;
  }

  Future<User> getUserDb(User user) async {
    final httpQuery = await http.post(
      Uri.parse(Constants.urlApi+"getUser.php")
      ,body: user.toJson()
    );
    User userTemp = User(
              id: 666,
              nom: "nom",
              prenom: "prenom",
              password: "password",
              email: Random().nextInt(100).toString(),
              reference: Random().nextInt(100).toString(),
              dateNaissance: DateTime.now(),
              dateCreation: DateTime.now(),
              etat: true,
              gcu: false,
              ville: "ville",
              pays: "pays",
              adresse: "adresse",
              telephone: "telephone",
              photoProfil: "photoProfil",
              photoBack: "photoBack",
              titreRole: "titreRole",
              about: "about"
              );
    
    if (httpQuery.statusCode == 200 ){
      userTemp = User.fromJson( json.decode(httpQuery.body)["data"] );
      print(userTemp);
      return userTemp;
    }

    return userTemp;
  }
}

void main(List<String> args) {
 User kev = User(
              id: 666,
              nom: "nom",
              prenom: "prenom",
              password: "password",
              email: '1',
              reference: Random().nextInt(100).toString(),
              dateNaissance: DateTime.now(),
              dateCreation: DateTime.now(),
              etat: true,
              gcu: false,
              ville: "ville",
              pays: "pays",
              adresse: "adresse",
              telephone: "telephone",
              photoProfil: "photoProfil",
              photoBack: "photoBack",
              titreRole: "titreRole",
              about: "about"
              );
//kev.addUserDb(kev); 
kev.getUserDb(kev);
 //print(jsonEncode(kev));
}

