import 'package:boxcom/models/post_model.dart';
import 'package:boxcom/pages/comments/components/comment.dart';
import 'package:boxcom/pages/comments/components/comment_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.comments,
            style: const TextStyle(
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          elevation: 10,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
      body: Stack(
        children: [
          ListView(
            children: [

              commentTile("beautiful post!"),

              commentTile("where is this place?"),
              commentTile("this is a wonderful post but i dont know how come the background image fits exactly in the box"),
              const SizedBox(height: 100,),

            ],
          ),
          
          comment(context)
        ],
      )
    );
  }
}
