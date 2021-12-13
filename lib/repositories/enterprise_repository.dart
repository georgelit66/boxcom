import 'package:boxcom/data/enterprises.dart';
import 'package:boxcom/models/enterprise_model.dart';

class EnterpriseRepository{
  List<Enterprise> fetchEnterprises(){
    return enterprises;
  }
}