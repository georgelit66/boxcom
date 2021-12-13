import 'package:boxcom/models/product_model.dart';

class Boutique{
  String name;
  String? state;
  String boutique_sector;
  String address;
  String imgUrl;
  String description;
  String telephone;
  String? website;
  int followers;
  int following;
  List<Product> products;

  Boutique({
    required this.name,
    this.website,
    this.state,
    required this.boutique_sector,
    required this.address,
    required this.imgUrl,
    required this.description,
    required this.telephone,
    required this.followers,
    required this.following,
    required this.products

});

}