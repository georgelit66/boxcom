import 'package:boxcom/pages/home_page/tabs/components/list_enterprises_boutiques_item.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/controller/providers/my_enterprise_partners_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/src/provider.dart';

class MyEnterprisePartners extends StatefulWidget {
  const MyEnterprisePartners({Key? key}) : super(key: key);

  @override
  _MyEnterprisePartnersState createState() => _MyEnterprisePartnersState();
}

class _MyEnterprisePartnersState extends State<MyEnterprisePartners> {
  @override
  Widget build(BuildContext context) {

    final myEnterprisePartners= context.watch<MyEnterprisePartnersProvider>().getEnterprisePartners();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        elevation: 10,
        title: Text(AppLocalizations.of(context)!.enterprisePartners),
      ),
      body:  ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemCount:myEnterprisePartners.length,
          itemBuilder: (BuildContext context, int index){
            var enterprise = myEnterprisePartners[index];
            return EnterpriseTile(enterprise: enterprise);
          }
      ),
    );
  }
}
