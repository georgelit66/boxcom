import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {

  final dynamic item;
  const ProductDetail({Key? key, this.item}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black54,),
        ),

        title: Text(widget.item.name!, style: TextStyle(color: Colors.black54),),
      ),
    );
  }
}
