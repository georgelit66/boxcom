import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget comment(BuildContext context){
  return   Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0,2),
            blurRadius: 3
          )
        ]
      ),
      constraints: const BoxConstraints(
        maxHeight: 190.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: TextField(
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.white70,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Write your comment...",
                  hintStyle: const TextStyle(
                    fontSize: 15.0,
                    color:Colors.black54,
                  ),
                ),
                maxLines: null,
              ),
              trailing: GestureDetector(
                onTap: () async {

                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.send,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}