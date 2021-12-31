import 'package:boxcom/pages/account/components/user_tile.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/controller/providers/enterprise_members_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/src/provider.dart';

class EnterpriseFollowers extends StatefulWidget {
  const EnterpriseFollowers({Key? key}) : super(key: key);

  @override
  _EnterpriseFollowersState createState() => _EnterpriseFollowersState();
}

class _EnterpriseFollowersState extends State<EnterpriseFollowers> {
  @override
  Widget build(BuildContext context) {
    final enterpriseMembers= context.watch<EnterpriseMembersProvider>().getEnterpriseMembers();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        elevation: 10,
        title:  Text(AppLocalizations.of(context)!.enterpriseMembers),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemCount: enterpriseMembers.length,
          itemBuilder: (BuildContext context, int index){
            var member = enterpriseMembers[index];
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
