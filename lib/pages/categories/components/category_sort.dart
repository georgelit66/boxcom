import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CategorySort(){
  return PopupMenuButton(
      icon: const Icon(Icons.filter_list),

      itemBuilder: (_) =>[


        const PopupMenuItem(
            child: Text("Price")
        ),
        const PopupMenuItem(
            child: Text("Location")
        ),
        const PopupMenuItem(
            child: Text("Date")
        ),
        const PopupMenuItem(
            child: Text("Brand")
        ),


      ]
  );
}
