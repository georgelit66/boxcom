import 'package:boxcom/data/boutiques.dart';
import 'package:boxcom/models/boutique_model.dart';
import 'package:flutter/cupertino.dart';

class BoutiqueProvider extends ChangeNotifier{


  List<Boutique> getBoutiques(){
    return boutiques;
  }
}