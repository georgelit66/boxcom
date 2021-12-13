import 'package:flutter/material.dart';

Widget BoutiqueSort(){
  return PopupMenuButton(
      icon: const Icon(Icons.filter_list, color: Colors.black54,),

      itemBuilder: (_) =>[


        const PopupMenuItem(
            child: Text("Retail")
        ),
        const PopupMenuItem(
            child: Text("Beauty")
        ),
        const PopupMenuItem(
            child: Text("Technology")
        ),
        const PopupMenuItem(
            child: Text("Construction")
        ),
        const PopupMenuItem(
            child: Text("Transport")
        ),

      ]
  );
}
