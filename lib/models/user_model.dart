class User {

  int? id;
  String name;
  String surname;
  String gender ;
  String town ;
  String country;
  int? state ;

  User({
    required  this.id,
    required this.name,
    required this.surname,
    required this.gender,
    required this.town,
    required this.country,
    this.state
 });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json['name'],
    surname: json['surname'],
    gender: json['gender'],
    town: json['town'],
    country: json['country'],
    state: json['state'],
    id: json['_user_id']
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'surname': surname,
    'gender': gender,
    'town': town,
    'country': country,
    'state': state,
    '_user_id' : id
  };
}