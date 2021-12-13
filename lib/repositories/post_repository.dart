import 'package:boxcom/data/posts.dart';
import 'package:boxcom/models/post_model.dart';

class PostRepository{
  List<Post> fetchPosts(){
   try{
     return postList;
   }catch(e){

     return [];
   }
  }
}