class User {

  String name;
  String surname;
  String gender ;
  String? photo;
  DateTime dateOfBirth;
  String town ;
  String country;
  String email;
  String password;
  String telephone;

  User({
    required  this.telephone,
    required this.name,
    required this.surname,
    required this.gender,
    required this.town,
    required this.dateOfBirth,
    required this.email,
    this.photo,
    required this.country,
    required this.password
 });

  factory User.fromJson(Map<String, dynamic> json) => User(
      name: json['name'],
      surname: json['surname'],
      gender: json['gender'],
      town: json['town'],
      photo: json['photo'],
      country: json['country'],
      password: json['state'],
      telephone: json['telephone'],
      email: json['email'],
      dateOfBirth: json['dateOfBirth']
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'surname': surname,
    'gender': gender,
    'town': town,
    'country': country,
    'photo': photo,
    'state': password,
    'telephone' : telephone,
    'password': password,
    'dateOfBirth': dateOfBirth,
    'email': email
  };
}