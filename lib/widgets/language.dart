import 'package:boxcom/l10n/l10n.dart';
import 'package:boxcom/util/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final localProvider = context.watch<LocaleProvider>();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title: const Text("Language"),
      ),

      body: ListView.builder(
          itemCount: L10n.all.length,
          itemBuilder: (context, index){


            return InkWell(
              onTap: (){
                final provider = Provider.of<LocaleProvider>(context, listen: false);
                provider.setLocale(L10n.all[index]);
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Text(
                  L10n.all[index].languageCode,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                title: Text(
                  L10n.getFlag(L10n.all[index].languageCode),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),

                trailing: localProvider.locale.languageCode == L10n.all[index].languageCode ? const Icon(Icons.check, color: Colors.cyan,): const SizedBox(width: 0, height: 0,),
              ),
            );

          }
      )
    );
  }
}



