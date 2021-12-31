import 'package:boxcom/models/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'favourite_item_detail.dart';

class FavouriteArticleItem extends StatefulWidget {
  const FavouriteArticleItem({Key? key, required this.post}) : super(key: key);
  
  final Post post;

  @override
  _FavouriteArticleItemState createState() => _FavouriteArticleItemState();
}

class _FavouriteArticleItemState extends State<FavouriteArticleItem> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> FavouriteItemDetail(post: widget.post,)));
      },
      child: ListTile(
        leading: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)
          ),
          child: FadeInImage(
            placeholder: const AssetImage(
                "assets/images/placeholder1.png"
            ),
            image: widget.post.imageUrl!.isEmpty ? const AssetImage("assets/images/hotel1.jpg"): AssetImage( widget.post.imageUrl!),
            fit: BoxFit.cover,
          )
        ),

        title: Text(widget.post.name),
        subtitle: Text(widget.post.description!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const SizedBox(
            child: Icon(Icons.delete)

        ),
      ),
    );
  }
}


class FavouriteProductItem extends StatefulWidget {
  const FavouriteProductItem({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  _FavouriteProductItemState createState() => _FavouriteProductItemState();
}

class _FavouriteProductItemState extends State<FavouriteProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> FavouriteItemDetail(post: widget.post,)));
      },
      child: ListTile(
        leading: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
            ),
            child: FadeInImage(
              placeholder: const AssetImage(
                  "assets/images/placeholder1.png"
              ),
              image: widget.post.imageUrl!.isEmpty ? const AssetImage("assets/images/hotel1.jpg"): AssetImage( widget.post.imageUrl!),
              fit: BoxFit.cover,
            )
        ),

        title: Text(widget.post.name),
        subtitle: Text(widget.post.description!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const SizedBox(
            child: Icon(Icons.delete)

        ),
      ),
    );
  }
}

