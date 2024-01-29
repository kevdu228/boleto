
class Categorie {
  int id;
  String lib;
  String photo;
  
  

  Categorie({
    this.id=0,
    this.lib ='',
    this.photo=''
  });

 
  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      id: int.parse(json['id']),
      lib: json['lib'],
      photo: json['photo'],
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lib': lib,
      'photo': photo
    };
  }

 
  
 

}
