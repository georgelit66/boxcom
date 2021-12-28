import 'package:boxcom/pages/categories/components/category_sort.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EnterpriseSearch extends StatefulWidget {
  const EnterpriseSearch({Key? key}) : super(key: key);

  @override
  _EnterpriseSearchState createState() => _EnterpriseSearchState();
}

class _EnterpriseSearchState extends State<EnterpriseSearch> {
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
        title:TextField(
          autofocus: true,
          decoration: InputDecoration.collapsed(
            hintText: "${AppLocalizations.of(context)!.search} ${AppLocalizations.of(context)!.enterpriseTab}",
          ),

        ),
        actions: <Widget>[
          CategorySort()
        ],
      ),
      body: Center(
        child: Text(
            AppLocalizations.of(context)!.searchResults
        ),
      )
    );
  }
}