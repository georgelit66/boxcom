class Automobile{
  String name;
  String price;
  String location;
  String description;
  String? image;

  Automobile({
    required this.name,
    required this.price,
    required this.location,
    required this.description,
    this.image
  });
}