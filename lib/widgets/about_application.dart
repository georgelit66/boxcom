import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutApplication extends StatefulWidget {
  const AboutApplication({Key? key}) : super(key: key);

  @override
  _AboutApplicationState createState() => _AboutApplicationState();
}

class _AboutApplicationState extends State<AboutApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title: Text(AppLocalizations.of(context)!.aboutApplication),
      ),
    );
  }
}
