import 'package:boxcom/pages/account/my_account.dart';
import 'package:boxcom/pages/authentication/login.dart';
import 'package:boxcom/pages/favourites/favourites_page.dart';
import 'package:boxcom/widgets/help_center_page.dart';
import 'package:boxcom/widgets/settings_screen.dart';
import 'package:boxcom/widgets/stored_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 12,
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(

                color: Colors.white,
              ),
              child: Center(
                  child:Stack(
                    children:  [

                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4.0,
                                color: Theme.of(context).backgroundColor
                            ),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0,10)
                              )
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/person.jpg'
                                ),
                                fit: BoxFit.cover
                            )
                        ),
                      ),

                      
                    ],
                  )
              ),
            ),

            const Divider(height: 2,),

            InkWell(
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyAccount()));
              },
              child:  ListTile(
                leading: const Icon(
                  Icons.perm_identity_sharp,
                  color: Colors.cyan,
                ),
                title: Text(
                  AppLocalizations.of(context)!.account,
                  style: const TextStyle(
                  ),
                ),
                trailing: const Icon(CupertinoIcons.forward) ,
              ),
            ),



            const SizedBox(height: 5.0,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Settings()));
              },
              child:  ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.cyan,
                ),
                title: Text(
                  AppLocalizations.of(context)!.settings,
                  style: const TextStyle(
                  ),
                ),
                trailing: const Icon(CupertinoIcons.forward) ,
              ),
            ),

            const SizedBox(height: 5.0,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const StoredFiles()));
              },
              child: ListTile(
                  leading: const Icon(
                    Icons.data_usage_outlined,
                    color: Colors.cyan,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.storedFiles,
                    style: const TextStyle(
                    ),
                  ),
                  trailing: const Icon(CupertinoIcons.forward)
              ),
            ),


            const SizedBox(height: 5.0,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HelpCenter()));
              },
              child: ListTile(
                leading: const Icon(
                  Icons.help_center_outlined,
                  color: Colors.cyan,
                ),
                title: Text(
                  AppLocalizations.of(context)!.helpCenter,
                  style: const TextStyle(
                  ),
                ),
                trailing: const Icon(CupertinoIcons.forward) ,
              ),
            ),





            const SizedBox(height: 5.0,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Favourites()));

              },
              child: ListTile(
                leading: const Icon(
                  CupertinoIcons.heart,
                  color: Colors.cyan,
                ),
                title: Text(
                  AppLocalizations.of(context)!.favourites,
                  style: const TextStyle(
                  ),
                ),
                trailing: const Icon(CupertinoIcons.forward),

              ),
            ),

            const SizedBox(height: 5.0,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> const LoginForm()));
              },
              child: ListTile(
                leading: const Icon(
                  CupertinoIcons.nosign,
                  color: Colors.cyan,
                ),
                title: Text(
                  AppLocalizations.of(context)!.logout,
                  style: const TextStyle(
                  ),
                ),
                trailing: const Icon(CupertinoIcons.forward),
              ),
            ),




          ],
        )

    );
  }
}
