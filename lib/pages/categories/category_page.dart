import 'package:boxcom/models/category_model.dart';
import 'package:boxcom/pages/categories/components/category_item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/category_sort.dart';

class CategoryPage extends StatefulWidget {
   const CategoryPage({Key? key, required this.category, }) : super(key: key);
  final  CategoryModel category;

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {

    var items = widget.category.items[0] as List<dynamic>;
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
        title: const TextField(
          decoration: InputDecoration.collapsed(
            hintText: 'Search ...',
          ),

        ),
        actions: <Widget>[
          CategorySort()
        ],
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              widget.category.category,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700
              ),
            ),
          ),

          const Divider(
            thickness: .75,
            height: .75,
            color: Colors.grey,
          ),

          const SizedBox(height: 10,),

         Expanded(
           child:  ListView.builder(
               itemCount:items.length,
               itemBuilder: (context, index){
                 List<dynamic> item = widget.category.items[0];
                 return  const Text("");
               }
           ),
         )
        ],
      )


    );
  }
}
