import 'package:boxcom/pages/categories/components/category_sort.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: const TextField(
          autofocus: true,
          decoration: InputDecoration.collapsed(
            hintText: 'Search Enterprise...',
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