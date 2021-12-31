import 'package:boxcom/models/post_model.dart';
import 'package:boxcom/pages/home_page/tabs/home_tab/components/post_view_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteItemDetail extends StatefulWidget {
  const FavouriteItemDetail({Key? key, required this.post}) : super(key: key);

  final Post post;
  @override
  _FavouriteItemDetailState createState() => _FavouriteItemDetailState();
}

class _FavouriteItemDetailState extends State<FavouriteItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Theme.of(context).bottomAppBarColor,
      ),
      body: Card(
          elevation: 10,
          child: PostHome(
              post: widget.post)
      )
    );
  }
}
