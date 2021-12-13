import 'package:boxcom/models/enterprise_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_enterprises_boutiques_item.dart';

class ListFollowers extends StatefulWidget {
  const ListFollowers({Key? key, required this.followers}) : super(key: key);

  final List<Enterprise> followers;

  @override
  _ListFollowersState createState() => _ListFollowersState();
}

class _ListFollowersState extends State<ListFollowers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Followers",
          style: TextStyle(
              color: Colors.black54
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),

      body: Container(
        child: widget.followers.isNotEmpty ? ListView.builder(
            itemCount: widget.followers.length,
            itemBuilder: (BuildContext context, int index){
              return EnterpriseTile(enterprise: widget.followers[index],);
            }
        ) : const Center(child: Text("No Followers yet...")
          ,
        ),
      ),
    );
  }
}
