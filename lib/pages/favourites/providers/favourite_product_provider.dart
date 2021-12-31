import 'package:boxcom/data/posts.dart';
import 'package:boxcom/models/post_model.dart';
import 'package:flutter/cupertino.dart';

class FavouriteProducts extends ChangeNotifier{


  List<Post> getFavouriteProducts(){
    return postList;
  }
}