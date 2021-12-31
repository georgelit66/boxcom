import 'package:boxcom/data/users.dart';
import 'package:boxcom/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class MyEnterpriseMembersProvider extends ChangeNotifier{


  List<User> getEnterpriseMembers(){
    return users;
  }
}