import 'dart:io';
import 'dart:typed_data';
import 'package:boxcom/data/enterprises.dart';
import 'package:boxcom/models/post_model.dart';
import 'package:boxcom/pages/comments/coment_screen.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/enterprise_detail.dart';
import 'package:boxcom/pages/home_page/tabs/home_tab/components/post_video.dart';
import 'package:boxcom/pages/home_page/tabs/home_tab/components/video_full_screen.dart';
import 'package:boxcom/pages/home_page/tabs/components/post_menu.dart';
import 'package:boxcom/pages/home_page/tabs/components/web_view.dart';
import 'package:boxcom/util/theme_provider.dart';
import 'package:boxcom/widgets/image_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:video_player/video_player.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_post_photo_video_detail.dart';

class PostHome extends StatefulWidget {

  PostHome({required this.post});
  final Post post;


  @override
  _PostHomeState createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome> {


  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        widget.post.videoUrl!
    )
      ..addListener(() =>  setState(() { }))
      ..initialize();
  }



  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }



  var _isLiked = false;
  var _showDescription = true;

  @override
  Widget build(BuildContext context) {


    final isMuted = _controller.value.volume == 0;

    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child:  Container(
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20.0),
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
                   width: MediaQuery.of(context).size.width - 18.0,
                   decoration: const BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(20.0))),
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(20.0),
                     child: GestureDetector(
                         onTap: () {
                          if(widget.post.videoUrl!.isEmpty){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePostZoom( post: widget.post)));
                          }


                         },
                         child: widget.post.imageUrl!.isEmpty ?  GestureDetector(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoFullScreen(controller: _controller, post: widget.post)));
                               },
                               child:
                                 Stack(
                                   children: [
                                     AspectRatio(
                                       aspectRatio: 5/3,
                                         child: PostVideo(controller: _controller,)
                                     ),

                                     Positioned(
                                         bottom: 10,
                                         left: 5,
                                         right: 5,
                                         child: progress(_controller)
                                     ),

                                     Positioned(
                                       left: 2,
                                         bottom: 18,
                                         child: Container(
                                           height: 35,
                                           width: 35,
                                           decoration:  BoxDecoration(
                                             color: Colors.black54,
                                             shape: BoxShape.circle,
                                             border: Border.all(
                                               color: Colors.white70,
                                               width: 2,
                                             ),
                                           ),
                                           child: IconButton(
                                               onPressed:()=>_controller.setVolume(isMuted ? 1: 0),
                                               icon:  Icon(
                                                 isMuted ? Icons.volume_mute : Icons.volume_up,
                                                 size: 15,
                                                 color: Colors.white70,
                                               )
                                           ),
                                         )
                                     ),


                                     Positioned(
                                         bottom: 0,
                                         left: 0,
                                         right: 0,
                                         top: 0,
                                         child: Center(
                                           child: _controller.value.isPlaying ?
                                            Container() :
                                           Container(
                                             height: 45,
                                             width: 45,
                                             decoration:  BoxDecoration(
                                               color: Colors.black54,
                                               shape: BoxShape.circle,
                                               border: Border.all(
                                                 color: Colors.white70,
                                                 width: 2,
                                               ),
                                             ),


                                             child: IconButton(
                                                 onPressed: (){
                                                   setState(() {
                                                     _controller.value.isPlaying ?
                                                     _controller.pause()
                                                         :_controller.play();
                                                   });
                                                 },
                                                 icon:  const Icon(
                                                   Icons.play_arrow,
                                                   size: 25,
                                                   color: Colors.white70,
                                                 )
                                             ),
                                           )
                                         )
                                     ),

                                     Positioned(
                                         bottom: 18,
                                         right: 6,
                                         child: Container(
                                           height: 35,
                                           width: 35,
                                           decoration:  BoxDecoration(
                                             color: Colors.black26,
                                             shape: BoxShape.circle,
                                             border: Border.all(
                                               color: Colors.black12,
                                               width: 1,
                                             ),
                                           ),
                                           child: IconButton(
                                               onPressed: (){
                                                 Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoFullScreen(controller: _controller, post: widget.post)));
                                               },
                                               icon: const Icon(
                                               Icons.fullscreen,
                                                 size: 15,
                                                 color: Colors.white70,

                                               )
                                           ),
                                         )
                                     )
                                   ],
                                 ),
                             )
                         : FutureBuilder(
                           future: imageInfo(widget.post.imageUrl!),
                           builder: (BuildContext context , AsyncSnapshot<Size> size){
                                    if(size.hasData){
                                      return size.data!.width > size.data!.height ?
                                      AspectRatio(
                                        aspectRatio: 4/3,
                                        child: Hero(
                                            tag:(widget.post.name),
                                            child: FadeInImage(
                                              placeholder: const AssetImage(
                                                  "assets/images/placeholder1.png"
                                              ),
                                              image:AssetImage( widget.post.imageUrl!),
                                              fit: BoxFit.cover,
                                            )
                                        ),
                                      ):AspectRatio(
                                        aspectRatio: 4/5,
                                        child: Hero(
                                            tag:(widget.post.name),
                                            child: FadeInImage(
                                              placeholder: const AssetImage(
                                                  "assets/images/placeholder1.png"
                                              ),
                                              image:AssetImage( widget.post.imageUrl!),
                                              fit: BoxFit.cover,
                                            )
                                        ),
                                      );

                                    }
                                    else{
                                      return Container();
                                    }
                           },

                         )
                     )
                   )
               ),

              postBottom()
            ],
          ),
        ),
      )
    );
  }

  Widget postHeader() {

timeago.setLocaleMessages('fr', timeago.FrMessages());
var currentLocale =AppLocalizations.of(context)!.localeName;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
       
          contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          leading: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> EnterpriseDetail(enterprise: enterprises[0]))
            );
          },
          child: SizedBox(
            height: 55,
            width: 55,
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: FadeInImage(
                placeholder: const AssetImage(
                    "assets/images/placeholder1.png"
                ),
                image:AssetImage( widget.post.enterpriseImage),
                fit: BoxFit.cover,
              ),
            ),
          )
         ),
          title: Text(
            widget.post.name,
            style: ThemeNotifier.lightTextTheme.headline3
          ),
          subtitle: Text(

            timeago.format(DateTime.parse(widget.post.time),locale: currentLocale),
            style: const TextStyle(
              color: Colors.black54
            ),
          ),
          trailing: Wrap(
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.language_outlined,
                  color: Colors.black54,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WebViewPage(website: widget.post.website)));
                },
              ),


              widget.post.imageUrl!.isNotEmpty ? PopUpMenuImage(color: Colors.black54, post: widget.post) : PopUpMenuVideo( post: widget.post, color: Colors.black54,)
            ],
          ),
        ),

        Padding(

            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child:  GestureDetector(
              onTap: (){
                setState(() {
                  _showDescription = !_showDescription;
                });
              },
              child: _showDescription ?  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post.description!,
                    style:ThemeNotifier.lightTextTheme.bodyText1,
                    maxLines: 2,
                    overflow:  TextOverflow.ellipsis ,
                  ),

                  widget.post.description!.length >= 100 ?
                  Text(
                    AppLocalizations.of(context)!.seeMore,
                    style: TextStyle(
                        color:Theme.of(context).primaryColor
                    ),
                    maxLines: 1,
                    overflow:  TextOverflow.ellipsis,
                  ): const SizedBox()
                ],
              ) :  Text(
                widget.post.description!,
                style: ThemeNotifier.lightTextTheme.bodyText1,
                overflow:  TextOverflow.visible,
              ),
            )
        ),
        const SizedBox(height: 5,)
      ],
    );
  }

  Widget postBottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          GestureDetector(
            onTap: (){
              setState(() {
                _isLiked = !_isLiked;
              });
            },
            child: Container(
              decoration: const BoxDecoration(
              ),

              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical:0),
              child: Row(
                children:  [
                  _isLiked ? Icon(
                    CupertinoIcons.heart_solid,
                    color: Theme.of(context).primaryColor,
                  ):
                  Icon(
                    CupertinoIcons.heart,
                    color:  Theme.of(context).primaryColor,
                  ),

                  const SizedBox(width: 10,),

                  Text(
                    widget.post.likes.toString(),
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 13
                    ),
                  )
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>  CommentScreen(post: widget.post,)));
            } ,
            child:  Container(
              decoration: const BoxDecoration(
              ),

              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical:0),
              child: Row(
                children: [
                  const Icon(
                    Icons.mode_comment_outlined,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    widget.post.comments.toString(),
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 13
                    ),
                  )
                ],
              ),
            ),
          ),


          InkWell(
            onTap: ()async {
              final ByteData bytes = await rootBundle.load(widget.post.imageUrl!);
              final Uint8List list = bytes.buffer.asUint8List();

              final tempDir = await getTemporaryDirectory();
              final file = await File('${tempDir.path}/image.jpg').create();
              file.writeAsBytes(list);
              Share.shareFiles([(file.path)]);
            },
            child: Row(
              children: const [
                Icon(
                  Icons.share,
                  color: Colors.black54,
                ),
                SizedBox(width: 10,),

              ],
            ),
          ),

        ],
      ),

    );
  }
}

Widget progress(VideoPlayerController _controller) => VideoProgressIndicator(
  _controller,
  allowScrubbing: true,
  colors: const VideoProgressColors(playedColor:  Colors.cyan, backgroundColor: Colors.grey),
  padding: const EdgeInsets.only(top: 20)
);
