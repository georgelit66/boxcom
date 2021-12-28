import 'package:boxcom/data/boutiques.dart';
import 'package:boxcom/data/enterprises.dart';
import 'package:boxcom/models/boutique_model.dart';
import 'package:boxcom/models/enterprise_model.dart';
import 'package:flutter/cupertino.dart';

class EnterpriseProvider extends ChangeNotifier{


  List<Enterprise> getEnterprises(){
    return enterprises;
  }
}