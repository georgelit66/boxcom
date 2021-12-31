import 'package:boxcom/data/users.dart';
import 'package:boxcom/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class MyBoutiqueMembersProvider extends ChangeNotifier{


  List<User> getBoutiqueMembers(){
    return users;
  }
}