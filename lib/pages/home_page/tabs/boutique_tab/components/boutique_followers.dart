import 'package:boxcom/pages/account/components/user_tile.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/controller/providers/boutique_members_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class BoutiqueFollowers extends StatefulWidget {
  const BoutiqueFollowers({Key? key}) : super(key: key);

  @override
  _BoutiqueFollowersState createState() => _BoutiqueFollowersState();
}

class _BoutiqueFollowersState extends State<BoutiqueFollowers> {
  @override
  Widget build(BuildContext context) {

    final boutiqueMembers= context.watch<BoutiqueMembersProvider>().getBoutiqueMembers();
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        elevation: 10,
        title: Text(AppLocalizations.of(context)!.boutiqueMembers),
      ),
       body: ListView.builder(
           padding: const EdgeInsets.only(top: 0),
           itemCount:boutiqueMembers.length,
           itemBuilder: (BuildContext context, int index){
             var member =boutiqueMembers[index];
             return Column(
               children: [
                 UserTile(user: member),
                 const SizedBox(height: 5),
               ],
             );
           }
       ),
    );
  }
}
