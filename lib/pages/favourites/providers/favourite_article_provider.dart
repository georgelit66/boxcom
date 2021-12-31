
import 'package:boxcom/data/posts.dart';
import 'package:boxcom/models/post_model.dart';
import 'package:flutter/cupertino.dart';

class FavouriteArticles extends ChangeNotifier{


  List<Post> getFavouriteArticles(){
    return postList;
  }
}