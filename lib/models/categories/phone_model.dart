class Phone{
  String name;
  String price;
  String location;
  String description;
  String? image;

  Phone({
    required this.name,
    required this.price,
    required this.location,
    required this.description,
    this.image
  });
}