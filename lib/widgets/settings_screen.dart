import 'package:boxcom/util/theme_provider.dart';
import 'package:boxcom/widgets/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'about_application.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title: Text(AppLocalizations.of(context)!.settings),
        elevation: 10,
      ),
      body: Center(
        child:  Column(
          children: [
            const SizedBox(height: 5.0,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const LanguageScreen()));
              },
              child:  ListTile(
                leading: const Icon(
                  Icons.language_outlined,
                  color: Colors.cyan,
                ),
                title: Text(
                  AppLocalizations.of(context)!.language,
                  style: const TextStyle(
                  ),
                ),


              ),
            ),

            const SizedBox(height: 5.0,),
            ListTile(
              leading:  Icon(
                Provider.of<ThemeNotifier>(context).darkTheme ?  CupertinoIcons.brightness_solid : CupertinoIcons.brightness,
                color: Colors.cyan,
              ),

              title:   Text(
                  AppLocalizations.of(context)!.darkTheme,
                style: const TextStyle(
                ),
              ),
              trailing: Consumer<ThemeNotifier>(
                builder: (context,notifier,child) => Switch(
                  activeColor:Colors.cyan,
                  onChanged: (val){
                    notifier.toggleTheme();
                  },
                  value: notifier.darkTheme ,
                ),
              ),
            ),

            const SizedBox(height: 5.0,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutApplication()));
              },
              child:  ListTile(
                leading: const Icon(
                  Icons.info,
                  color: Colors.cyan,
                ),
                title: Text(
                  AppLocalizations.of(context)!.aboutApplication,
                  style: const TextStyle(
                  ),
                ),


              ),
            ),

          ],
        )
      ),
    );
  }
}
