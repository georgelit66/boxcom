import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CategorySort(){
  return PopupMenuButton(
      icon: const Icon(Icons.filter_list, color: Colors.black54,),

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
