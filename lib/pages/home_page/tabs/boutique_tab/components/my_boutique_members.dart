import 'package:boxcom/pages/account/components/user_tile.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/controller/providers/my_boutique_members_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/src/provider.dart';

class MyBoutiqueMembers extends StatefulWidget {
  const MyBoutiqueMembers({Key? key}) : super(key: key);

  @override
  _MyBoutiqueMembersState createState() => _MyBoutiqueMembersState();
}

class _MyBoutiqueMembersState extends State<MyBoutiqueMembers> {
  @override
  Widget build(BuildContext context) {
    final myBoutiqueMembers= context.watch<MyBoutiqueMembersProvider>().getBoutiqueMembers();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        elevation: 10,
        title:  Text(AppLocalizations.of(context)!.boutiqueMembers),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemCount:myBoutiqueMembers.length,
          itemBuilder: (BuildContext context, int index){
            var member =myBoutiqueMembers[index];
            return Column(
              children: [
                UserTile(user: member),
                const SizedBox(height: 5),
              ],
            );
          }
      ) ,
    );
  }
}
