import 'package:boxcom/data/boutiques.dart';
import 'package:boxcom/models/boutique_model.dart';
import 'package:flutter/cupertino.dart';

class MyBoutiquePartnersProvider extends ChangeNotifier{


  List<Boutique> getBoutiquePartners(){
    return boutiques;
  }
}