import 'package:boxcom/models/enum/post_type.dart';

class Post {
  String enterpriseImage;
  String name;
  String? imageUrl;
  String? videoUrl;
  String website;
  String? description;
  String enterpriseCategory;
  int likes;
  int comments;
  String time;
  PostType postType;

  Post(
      {required this.enterpriseImage,
      required this.name,
      required this.website,
      this.description,
      required this.enterpriseCategory,
      this.videoUrl,
      this.imageUrl,
      required this.likes,
      required this.comments,
      required this.time,
      required this.postType});
}
