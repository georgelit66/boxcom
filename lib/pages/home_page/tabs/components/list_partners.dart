import 'package:boxcom/models/enterprise_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_enterprises_boutiques_item.dart';

class ListPartners extends StatefulWidget {
  const ListPartners({Key? key, required this.partners}) : super(key: key);

  final List<Enterprise> partners;

  @override
  _ListPartnersState createState() => _ListPartnersState();
}

class _ListPartnersState extends State<ListPartners> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Partners",
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
        child: widget.partners.isNotEmpty ? ListView.builder(
            itemCount: widget.partners.length,
            itemBuilder: (BuildContext context, int index){
              return EnterpriseTile(enterprise: widget.partners[index],);
            }
        ) : const Center(child: Text("No partners yet...")
          ,
        ),
      ),
    );
  }
}
