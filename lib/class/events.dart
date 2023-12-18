class Event {
  int id;
  String reference;
  String title;
  String about;
  String mapLatitude;
  String mapLongitude;
  String country;
  String city;
  String address;
  String category;
  String whatsapp;
  String telegram;
  DateTime createDate;
  DateTime startDate;
  DateTime endDate;
  String imgFirst;
  String imgSecond;
  String imgLast;
  int userId;
  int likeCount;
  bool state;
  bool special;
  bool treeState;
  String contact1;
  String contact2;

  Event({
    required this.id,
    required this.reference,
    required this.title,
    required this.about,
    required this.mapLatitude,
    required this.mapLongitude,
    required this.country,
    required this.city,
    required this.address,
    required this.category,
    required this.whatsapp,
    required this.telegram,
    required this.createDate,
    required this.startDate,
    required this.endDate,
    required this.imgFirst,
    required this.imgSecond,
    required this.imgLast,
    required this.userId,
    required this.likeCount,
    required this.state,
    required this.special,
    required this.treeState,
    required this.contact1,
    required this.contact2,
  });

  // Factory constructor to create an Event object from a map (e.g., from database query)
  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['idevent'],
      reference: map['refevent'],
      title: map['titreevent'],
      about: map['aboutevent'],
      mapLatitude: map['maplatevent'],
      mapLongitude: map['maplongevent'],
      country: map['payseevent'],
      city: map['villeevent'],
      address: map['adresseevent'],
      category: map['catevent'],
      whatsapp: map['whatsapevent'],
      telegram: map['telegramevent'],
      createDate: DateTime.parse(map['createdateevent']),
      startDate: DateTime.parse(map['startdateevent']),
      endDate: DateTime.parse(map['enddateevent']),
      imgFirst: map['imgfirstevent'],
      imgSecond: map['imgsecondevent'],
      imgLast: map['imglastevent'],
      userId: map['iduserevent'],
      likeCount: map['nbrlikeevent'],
      state: map['etatevent'] == 1,
      special: map['specialevent'] == 1,
      treeState: map['etatreelevent'] == 1,
      contact1: map['contactevent1'],
      contact2: map['contactevent2'],
    );
  }

  // Convert the Event object to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      'idevent': id,
      'refevent': reference,
      'titreevent': title,
      'aboutevent': about,
      'maplatevent': mapLatitude,
      'maplongevent': mapLongitude,
      'payseevent': country,
      'villeevent': city,
      'adresseevent': address,
      'catevent': category,
      'whatsapevent': whatsapp,
      'telegramevent': telegram,
      'createdateevent': createDate.toIso8601String(),
      'startdateevent': startDate.toIso8601String(),
      'enddateevent': endDate.toIso8601String(),
      'imgfirstevent': imgFirst,
      'imgsecondevent': imgSecond,
      'imglastevent': imgLast,
      'iduserevent': userId,
      'nbrlikeevent': likeCount,
      'etatevent': state ? 1 : 0,
      'specialevent': special ? 1 : 0,
      'etatreelevent': treeState ? 1 : 0,
      'contactevent1': contact1,
      'contactevent2': contact2,
    };
  }
}
