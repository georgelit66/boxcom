import 'package:boxcom/pages/categories/components/category_sort.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white,
        title: const TextField(
          autofocus: true,
          decoration: InputDecoration.collapsed(
            hintText: 'Search Boutique...',
          ),

        ),
        actions: <Widget>[
          CategorySort()
        ],
      ),
      body: const Center(
        child: Text(
          "Search results."
        ),
      )
    );
  }
}