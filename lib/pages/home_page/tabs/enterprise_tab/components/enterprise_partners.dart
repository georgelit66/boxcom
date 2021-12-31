import 'package:boxcom/pages/home_page/tabs/components/list_enterprises_boutiques_item.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/controller/providers/enterprise_partners_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class EnterprisePartners extends StatefulWidget {
  const EnterprisePartners({Key? key}) : super(key: key);

  @override
  _EnterprisePartnersState createState() => _EnterprisePartnersState();
}

class _EnterprisePartnersState extends State<EnterprisePartners> {
  @override
  Widget build(BuildContext context) {
    final enterprisePartners= context.watch<EnterprisePartnersProvider>().getEnterprisePartners();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        elevation: 10,
        title: Text(AppLocalizations.of(context)!.enterprisePartners),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemCount:enterprisePartners.length,
          itemBuilder: (BuildContext context, int index){
            var enterprise = enterprisePartners[index];
            return EnterpriseTile(enterprise: enterprise);
          }
      ),
    );
  }
}
