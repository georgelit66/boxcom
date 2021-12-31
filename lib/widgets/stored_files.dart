import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoredFiles extends StatefulWidget {
  const StoredFiles({Key? key}) : super(key: key);

  @override
  _StoredFilesState createState() => _StoredFilesState();
}

class _StoredFilesState extends State<StoredFiles> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title: Text(AppLocalizations.of(context)!.storedFiles),
      ),
    );
  }
}
