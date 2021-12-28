import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
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
        backgroundColor: Colors.white,
        title: TextField(
          autofocus: true,
          decoration: InputDecoration.collapsed(
            hintText: AppLocalizations.of(context)!.search,
          ),

        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.filter_list,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
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