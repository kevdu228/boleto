import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class Constants{
  static const urlApi = "https://chillilo.co/Boleto/php/";
  static double widthSm = 300;
  static double heightSm = 200; 
  static double textSm = 0.0;
  static double widthLg = 360;
  static double heightLg = 250;
  static double textLg = 0.0;
  List<String> files = [];
  bool connected = false;

  static const numbertoMonth = {
    "01":"JAN",
    "02":"FEV",
    "03":"MAR",
    "04":"AVR",
    "05":"MAI",
    "06":"JUN",
    "07":"JUI",
    "08":"AOU",
    "09":"SEP",
    "10":"OCT",
    "11":"NOV",
    "12":"DEC",

  };

  static formater(String prix) {
    final formatter = new NumberFormat.currency(
        locale: 'fr_CA', decimalDigits: 0, symbol: '');
    String fin = formatter.format(double.parse(prix));

    return "${fin} CFA";
  }

  Future<String> get _localPath async {
    final dossier = await getApplicationDocumentsDirectory();
    return dossier.path;
  }

  Future<List<File>> get _loaclFile async {
    final chemin = await _localPath;
    List<File> files = [];
    List<String> filesS = [
      'log.txt',
      'user.txt'
    ];
    for (int i = 0; i < filesS.length; i++) {
      files.add(File('$chemin/' + filesS[i]));
    }

    return files;
  }

  ecricreFicher(String log, user) async {
    final List<File> file = await _loaclFile;
    print(file.length);
    List<String> files = [log,user];
    for (int i = 0; i < file.length; i++) {
      file[i].writeAsString(files[i].toString());
      
    }
  }
  del()async{
    final chemin = await _localPath;
    List<File> files = [];
    List<String> filesS = [
      'log.txt',
      'user.txt'
    ];
    for (int i = 0; i < filesS.length; i++) {
      await File('$chemin/' + filesS[i]).delete();
    }
    
  }

  lireFicher() async {
    try {
      final List<File> file = await _loaclFile;
      
      
      for (int i = 0; i < file.length; i++) {
        await file[i].readAsString().then((value) {
          
          files.add(value) ;
          
          });
        
      }
       
    } catch (e) {}
  }
  


}