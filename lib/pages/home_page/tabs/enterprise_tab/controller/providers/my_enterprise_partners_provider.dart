import 'package:boxcom/data/enterprises.dart';
import 'package:boxcom/models/enterprise_model.dart';
import 'package:flutter/cupertino.dart';

class MyEnterprisePartnersProvider extends ChangeNotifier{


  List<Enterprise> getEnterprisePartners(){
    return enterprises;
  }
}