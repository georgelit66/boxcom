import 'package:boxcom/repositories/enterprise_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test('get enterprises', (){
    var enterprises = EnterpriseRepository().fetchEnterprises()[1];
    expect(enterprises, List);

  });

}