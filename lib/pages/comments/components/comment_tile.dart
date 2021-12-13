import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget commentTile(String comment){
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children:  [
      const ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
        leading: CircleAvatar(
          radius: 20.0,
          backgroundImage: AssetImage('assets/images/hotel2.jpg'),
        ),
        title: Text(
          "Paul Washer",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          "5 minutes ago",
          style: TextStyle(fontSize: 12.0),
        ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
        child: Text(
         comment,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
      const Divider()
    ],
  );
}