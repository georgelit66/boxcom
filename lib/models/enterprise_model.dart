import 'package:boxcom/models/post_model.dart';
class Enterprise {
  int? id;
  String? idCreator;
  String tagName;
  String name;
  String image;
  String enterpriseSector;
  String description;
  String pays;
  String ville;
  String address;
  String website;
  String openHour;
  String closingHour;
  String telephone;
  String gmail;
  String? creationDate;
  String? suppressionDate;
  List<Post> myPosts;
  int? state;


  Enterprise({
    this.id,
    this.idCreator,
    required this.tagName,
    required this.gmail,
    this.creationDate,
    this.suppressionDate,
    required this.name,
    required this.website,
    required this.telephone,
    required this.ville,
    required this.description,
    required this.enterpriseSector,
    required this.pays,
    required this.openHour,
    required this.closingHour,
    this.state,
    required this.image,
    required this.address,
    required this.myPosts
  });


  factory Enterprise.fromJson(Map<String, dynamic> json) => Enterprise(
    id: json['enterprise_id'],
      name: json['name'],
      website: json['website'],
      telephone: json['telephone'],
      ville: json['location'],
      description: json['description'],
      enterpriseSector: json['category'],
      pays: json['pays'],
      image: json['image'],
      closingHour: json['closingHour'],
      openHour: json['openHour'],
    address: json['address'],
    gmail: json['gmail'],
    idCreator: json['idCreator'],
    tagName: json['tagName'],
    creationDate: json['creationDate'],
    myPosts: json['posts']
  );

  Map<String, dynamic> toJson() => {
    'enterprise_id': id,
    'name': name,
    'website': website,
    'telephone': telephone,
    'location': ville,
    'description': description,
    'category': enterpriseSector,
    'country':pays,
    'myPosts': myPosts

  };



}


