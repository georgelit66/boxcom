import 'package:boxcom/pages/account/components/user_tile.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/controller/providers/my_enterprise_members_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/src/provider.dart';

class MyEnterpriseMembers extends StatefulWidget {
  const MyEnterpriseMembers({Key? key}) : super(key: key);

  @override
  _MyEnterpriseMembersState createState() => _MyEnterpriseMembersState();
}

class _MyEnterpriseMembersState extends State<MyEnterpriseMembers> {
  @override
  Widget build(BuildContext context) {
    final myEnterpriseMembers= context.watch<MyEnterpriseMembersProvider>().getEnterpriseMembers();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        elevation: 10,
        title: Text(AppLocalizations.of(context)!.enterpriseMembers),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemCount: myEnterpriseMembers.length,
          itemBuilder: (BuildContext context, int index){
            var member = myEnterpriseMembers[index];
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
