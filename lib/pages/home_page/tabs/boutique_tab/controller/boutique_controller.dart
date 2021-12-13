import 'package:boxcom/models/boutique_model.dart';
import 'package:boxcom/models/enterprise_model.dart';
import 'package:boxcom/repositories/boutique_repository.dart';
import 'package:boxcom/repositories/enterprise_repository.dart';
import 'package:get/get.dart';

class BoutiqueController extends GetxController{

  late List<Boutique> boutiques;
  late List<Enterprise> enterprises;


  @override
  void onInit(){
    super.onInit();
    fetchBoutique();
    fetchEnterprises();
  }

  fetchBoutique(){
   try {
     boutiques = BoutiqueRepository().fetchBoutiques().obs;
   } catch(e){

    return e.obs;
   }

  }

  fetchEnterprises(){
   try{
     enterprises = EnterpriseRepository().fetchEnterprises().obs;

   }catch(e){
     return e.obs;
   }

  }
}