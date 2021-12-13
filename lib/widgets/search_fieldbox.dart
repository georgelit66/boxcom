import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _searchField(BuildContext context) {
  return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.greenAccent, width: .021),
        color: Colors.white70,
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 15,
            offset: const Offset(5, 5),
          )
        ],
      ),
      child:  const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white70),
          suffixIcon: SizedBox(
            width: 50,
            child: Icon(Icons.search, color:Colors.greenAccent),
          ),
        ),
      )
  );
}