
import 'package:flutter/cupertino.dart';
import 'constants.dart' ;
import 'package:http/http.dart' as http;
import 'dart:convert';
class User {
  int id;
  String nom , prenom , password , email , reference;
  DateTime dateNaissance = DateTime.now(), dateCreation=DateTime.now();
  bool etat , gcu;
  String ville, pays,adresse, telephone,photoProfil,photoBack,titreRole, about;
  

  

  User({
     this.id = 0,
     this.nom = 'bedinade',
     this.prenom = '',
     this.password = '',
     this.email = '',
     this.reference = '',
     DateTime? dateNaissance,
     DateTime? dateCreation,
     this.etat = false,
     this.gcu = false,
     this.ville = '',
     this.pays = '',
     this.adresse = '',
     this.telephone = '',
     this.photoProfil = '',
     this.photoBack = '',
     this.titreRole = '',
     this.about = '',
 
  });

  editUser(User user){
     id = user.id;
     nom = user.nom;
     prenom = user.prenom;
     password = user.password;
     email = user.email;
     reference = user.reference;
     dateNaissance = user.dateNaissance;
     dateCreation = user.dateCreation;
     etat = user.etat;
     gcu = user.gcu;
     ville = user.ville;
     pays = user.pays;
     adresse = user.adresse;
     telephone = user.telephone;
     photoProfil = user.photoProfil;
     photoBack = user.photoBack;
     titreRole = user.titreRole;
     about = user.about;
     
     
 
  }

  

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

  set setId(int id){
    this.id = id;
  }
  setName(String nom){
    this.nom = nom;
  }

  @override
  String toString(){
    return "id : $id , nom : $nom , email : $email , etat : $etat";
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
  

  deleteUser(User user) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/deleteUser.php"),
      body: user.toJson()
    );

    if( httpQuery.statusCode== 200){
      return json.decode(httpQuery.body)["msg"];
    }
    

  }

  editUserDb(User user) async {
    
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/editUser.php"),
      body: user.toJson()
    );

    if( httpQuery.statusCode== 200){
      return json.decode(httpQuery.body)["msg"];
    }
   
    

  }

    addUserDb(User user) async {
    final httpQuery = await http.post(
      Uri.parse("${Constants.urlApi}users/addUser.php"),
      body: user.toJson()

    );

    
    if (httpQuery.statusCode == 200){
      print(httpQuery.body);
        if(jsonDecode(httpQuery.body)["statut"]==false){
          user.setId=0;
          editUser(user); 

        }else{
          user.setId = int.parse(jsonDecode(httpQuery.body)["data"]["iduser"]);  
          editUser(user); 
        }
        
      
    }
    
    
     
  }

   
}

Future<void> main(List<String> args) async {
 User kev = User(
              id: 666,
              nom: "BEDINADEM_aps_agnimd",
              prenom: "prenom",
              password: "password",
              email: 'CmOutWithSomek=+wdewftimmnfgThisCl+ean@gffailsss.cdcaahnfgb',
              reference: '@ouigdsdcs+=keffe-f099eddkkcd+hffntg',
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

kev = await kev.addUserDb(kev);  
kev.setName("Nicky Larson");
await kev.editUser(kev);
await kev.deleteUser(kev);




 

}

