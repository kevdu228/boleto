import 'package:boleto_scan/controller/user_controller.dart';
import 'package:boleto_scan/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dateN = TextEditingController();
  TextEditingController ville = TextEditingController();
  TextEditingController pays = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController mdp = TextEditingController();
  TextEditingController mdp2 = TextEditingController();
  DateTime selectedDate = DateTime(1998, 6, 3);
  User use = User();
  

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        barrierColor: Colors.grey.withOpacity(0.5),
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateN.text = selectedDate.toString();
      });
    }
  }
  
  @override
  void initState() {
    
    use = User(
      nom: nom.text,
      prenom: prenom.text,
      password: '',
      email: '',
      reference: '',
      dateNaissance: selectedDate,
      etat: false,
      gcu: false,
      ville: '',
      pays: '',
      adresse: '',
      telephone: '',
      photoProfil: '',
      photoBack: '',
      titreRole: '',
      about: '',
    );
    final provider = Provider.of<UserController>(context,listen:false);
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserController>(context);
    return Consumer<UserController>(
      builder: (context, value, child) => Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 20, top: 5, bottom: 5),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          CupertinoIcons.back,
                          size: 30,
                        ),
                      ),
                      const Text(
                        "Mes Informations",
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
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xffe60023))),
                      width: double.infinity,
                      height: 50,
                      child: TextField(
                        controller: nom,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon:
                                const Icon(Icons.supervised_user_circle_rounded),
                            hintText: value.user.nom !=""?value.user.nom:"nom"),
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
                          border: Border.all(color: const Color(0xffe60023))),
                      width: double.infinity,
                      height: 50,
                      child: TextField(
                        controller: prenom,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon:
                                const Icon(Icons.supervised_user_circle_rounded),
                            hintText: value.user.prenom !=""?value.user.nom:"prenom"),
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
                          border: Border.all(color: const Color(0xffe60023))),
                      width: double.infinity,
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.email),
                            hintText:value.user.email !=""?value.user.email:"email@email.com" ),
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
                          border: Border.all(color: const Color(0xffe60023))),
                      width: double.infinity,
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: dateN,
                        obscureText: true,
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.password),
                            hintText: value.user.dateNaissance !=""?value.user.dateNaissance.toString():"Date de naissance" ),
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
                          border: Border.all(color: const Color(0xffe60023))),
                      width: double.infinity,
                      height: 50,
                      child: TextField(
                        controller: ville,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.password),
                            hintText: value.user.ville !=""?value.user.ville:"Ville"),
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
                          border: Border.all(color: const Color(0xffe60023))),
                      width: double.infinity,
                      height: 50,
                      child: TextField(
                        controller: pays,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon:
                                const Icon(Icons.supervised_user_circle_rounded),
                            hintText: value.user.pays !=""?value.user.pays:"Pays"),
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
                          border: Border.all(color: const Color(0xffe60023))),
                      width: double.infinity,
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.streetAddress,
                        controller: adresse,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon:
                                const Icon(Icons.supervised_user_circle_rounded),
                            hintText:  value.user.adresse !=""?value.user.adresse:"Adresse" ),
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
                          border: Border.all(color: const Color(0xffe60023))),
                      width: double.infinity,
                      height: 50,
                      child: TextField(
                        controller: telephone,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.phone),
                            hintText:  value.user.telephone !=""?value.user.telephone:"Telephone"),
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
                          border: Border.all(color: const Color(0xffe60023))),
                      width: double.infinity,
                      height: 50,
                      child: TextField(
                        controller: mdp,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.password),
                            hintText: value.user.password !=""?value.user.password:"Mot de passe"),
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
                          border: Border.all(color: const Color(0xffe60023))),
                      width: double.infinity,
                      height: 50,
                      child: TextField(
                        controller: mdp2,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.password),
                            hintText:  value.user.email !=""?value.user.email:"Confirmez le mot de passe" ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 20),
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
                          onPressed: () {
                            // Navigator.push(context,
                            //  MaterialPageRoute(builder: (context)=> Dashboard()));
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.black),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),
                          child: const Text(
                            "Enregistrez ",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 40, top: 0),
                      child: GestureDetector(
                        onTap: () {
                          
                          provider.user.editUser(User(
                            nom: nom.text,
                            prenom: prenom.text,
                            password: mdp.text,
                            email: email.text,
                            reference: '',
                            dateNaissance: selectedDate,
                            etat: false,
                            gcu: false,
                            ville: ville.text,
                            pays: pays.text,
                            adresse: adresse.text,
                            telephone: telephone.text,
                            photoProfil: '',
                            photoBack: '',
                            titreRole: '',
                            about: '',
                          ));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              "Supprimer mon compte",
                              style: TextStyle(
                                color: Colors.grey,
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
      ),
    );
  }
}
