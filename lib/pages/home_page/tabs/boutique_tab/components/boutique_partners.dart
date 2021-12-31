import 'package:boxcom/pages/home_page/tabs/boutique_tab/controller/providers/boutique_partners_provider.dart';
import 'package:boxcom/pages/home_page/tabs/components/list_enterprises_boutiques_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class BoutiquePartners extends StatefulWidget {
  const BoutiquePartners({Key? key}) : super(key: key);

  @override
  _BoutiquePartnersState createState() => _BoutiquePartnersState();
}

class _BoutiquePartnersState extends State<BoutiquePartners> {
  @override
  Widget build(BuildContext context) {
    final boutiquePartners= context.watch<BoutiquePartnersProvider>().getBoutiquePartners();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        elevation: 10,
        title:  Text(AppLocalizations.of(context)!.boutiquePartners),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemCount:boutiquePartners.length,
          itemBuilder: (BuildContext context, int index){
            var boutique =boutiquePartners[index];
            return Column(
              children: [
                BoutiqueTile(boutique: boutique),
                const SizedBox(height: 5),
              ],
            );
          }
      ) ,
    );
  }
}
