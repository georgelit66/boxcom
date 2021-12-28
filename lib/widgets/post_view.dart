import 'package:boxcom/models/enterprise_model.dart';
import 'package:boxcom/pages/home_page/tabs/components/web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Post extends StatefulWidget {
  final Enterprise post;
  Post({required this.post});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
late VideoPlayerController controller;


var _showDescription = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0.0, 2.0),
                  color: Colors.white70,
                  blurRadius: 5.0)
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            postHeader(),
            Container(
                height: MediaQuery.of(context).size.height * .379,
                width: MediaQuery.of(context).size.width - 18.0,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: GestureDetector(
                    onTap: () {

                    },
                    child:Hero(
                      tag:(widget.post.telephone),
                      child:
                    const Image(
                          image: AssetImage(""),
                          fit: BoxFit.cover
                      )
                    )
                  ),
                )
            ),
            postBottom()
          ],
        ),
      ),
    );
  }

  Widget postHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          leading: const CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage(""),
          ),
          title: Text(
            widget.post.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            widget.post.enterpriseSector,
          ),
          trailing: Wrap(
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.language_outlined,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WebViewPage(website: widget.post.website,)));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  size: 25,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),

       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15),
         child:  GestureDetector(
           onTap: (){
             setState(() {
               _showDescription = !_showDescription;
             });
           },
           child: _showDescription ?  Text(
             widget.post.description,
             style: const TextStyle(
               fontSize: 16
             ),
             maxLines: 2,
             overflow:  TextOverflow.ellipsis ,
           ) :  Text(
             widget.post.description,
             style: const TextStyle(
                 fontSize: 16
             ),
             overflow:  TextOverflow.visible ,
           ),
         )
       ),
        const SizedBox(height: 5,)
      ],
    );
  }

  Widget postBottom() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.thumb_up_alt,
                      size: 18,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 2.0,),
                    Text(
                        "42"
                    )
                  ],
                ),

                const Text(
                    "45"
                )
              ],
            ),

            const SizedBox(height: 5.0,),
            const Divider(thickness:0.75,color: Colors.black26,),
            const SizedBox(height: 5.0,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Icon(
                        CupertinoIcons.heart,
                        color: Colors.black54,
                        size: 18,
                      ),
                      Text(
                        "Like",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 13
                        ),
                      )
                    ],
                  ),


                  GestureDetector(
                    onTap:(){
                    } ,
                    child:  Column(
                      children: const [
                        Icon(
                          Icons.message,
                          color: Colors.black54,
                          size: 18,
                        ),
                        Text(
                          "Comment",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 13
                          ),
                        )
                      ],
                    ),
                  ),


                  Column(
                    children: const [
                      Icon(
                        Icons.share_sharp,
                        color: Colors.black54,
                        size: 18,
                      ),
                      Text(
                        "Share",
                        style: TextStyle(
                            color:Colors.black87,
                            fontSize: 13
                        ),
                      )
                    ],
                  ),

                  Column(
                    children: const [
                      Icon(
                        Icons.send,
                        color: Colors.black54,
                        size: 18,
                      ),
                      Text(
                        "Send",
                        style: TextStyle(
                            color:Colors.black87,
                            fontSize: 13
                        ),
                      )
                    ],
                  )
                ],
              ),

            ),
            const SizedBox(height: 4,),

          ],
        )
    );
  }
}

