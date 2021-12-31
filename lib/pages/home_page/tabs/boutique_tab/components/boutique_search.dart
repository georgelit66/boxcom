import 'package:boxcom/pages/categories/components/category_sort.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoutiqueSearch extends StatefulWidget {
  const BoutiqueSearch({Key? key}) : super(key: key);

  @override
  _BoutiqueSearchState createState() => _BoutiqueSearchState();
}

class _BoutiqueSearchState extends State<BoutiqueSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title:  TextField(
          autofocus: true,
          decoration: InputDecoration.collapsed(
            hintText: "${ AppLocalizations.of(context)!.search} Boutique",
          ),

        ),
        actions: <Widget>[
          CategorySort()
        ],
      ),
      body:  Center(
        child: Text(
            AppLocalizations.of(context)!.searchResults
        ),
      )
    );
  }
}