import 'package:boxcom/data/posts.dart';
import 'package:boxcom/pages/home_page/tabs/components/post_menu.dart';
import 'package:boxcom/pages/home_page/tabs/home_tab/components/post_video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoFullScreen extends StatefulWidget {

  final VideoPlayerController controller;


  const VideoFullScreen({Key? key, required this.controller}) : super(key: key);

  @override
  _VideoFullScreenState createState() => _VideoFullScreenState();
}

class _VideoFullScreenState extends State<VideoFullScreen> {

  void _landScape(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
  }


  void _potrait(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }


  @override
  void dispose() {

    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
  }


  @override
  Widget build(BuildContext context) {

    bool isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;

    return  isLandScape ?
       Scaffold(
         body:  Stack(
           children: [

             Positioned(
               top: 0,
               bottom: 0,
               left: 0,
               right: 0,
               child:   GestureDetector(
                 onTap: (){
                   setState(() {
                     widget.controller.value.isPlaying ?
                     widget.controller.pause()
                         :widget.controller.play();
                   });
                 },
                 child: AspectRatio(
                     aspectRatio: widget.controller.value.aspectRatio,
                     child: PostVideo(controller: widget.controller)
                 ),
               ),
             ),



         Positioned(
           bottom: 0,
           left: 0,
           right: 0,
           top: 0,
           child: Center(
             child: widget.controller.value.isPlaying ?
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
                       widget.controller.value.isPlaying ?
                       widget.controller.pause()
                           :widget.controller.play();
                     });
                   },
                   icon:  const Icon(
                     Icons.play_arrow,
                     size: 25,
                     color: Colors.white70,
                   )
               ),
             ),
           )
         ),

             Positioned(
               bottom: 0,
               right: 0,
               left: 0,
               child: Container(
                 height: 60.0,
                 decoration: const BoxDecoration(
                   gradient: LinearGradient(colors: [Colors.black54,Colors.transparent],begin: Alignment.bottomCenter,end: Alignment.topCenter
                   ),),
               ),
             ),



             Positioned(
                 bottom: 30,
                 left: 60,
                 right: 100,
                 child: progress(widget.controller)
             ),

             Positioned(
                 bottom: 20,
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
                         setState(() {
                           _potrait();
                         });
                       },
                       icon: const Icon(
                         Icons.close_fullscreen_sharp,
                         size: 15,
                         color: Colors.white70,

                       )
                   ),
                 )
             ),

             Positioned(
               bottom: 25,
                right: 50,
                 child:  Text(
                   "0${widget.controller.value.duration.inMinutes} : ${widget.controller.value.duration.inSeconds}",
                   style: const TextStyle(
                       color: Colors.white
                   ),

                 ),
             ),

             Positioned(
               bottom: 25,
                 left: 5,
                 child: ValueListenableBuilder(
                   valueListenable:widget.controller,
                   builder: (context, VideoPlayerValue value, child) {
                     //Do Something with the value.
                     return Text(
                       "0${value.position.inMinutes.toString()} : ${value.position.inSeconds.toString()} ",
                       style: const TextStyle(
                           color: Colors.white
                       ),
                     );
                   },
                 ),
             ),

             Positioned(
               top: 0,
               right: 0,
               left: 0,
               child: Container(
                 height: 55.0,
                 decoration: const BoxDecoration(
                   gradient: LinearGradient(colors: [Colors.black12,Colors.transparent],begin: Alignment.bottomCenter,end: Alignment.topCenter
                   ),),
               ),
             ),

             Positioned(
                 top: 10,
                 left:15,
                 child: IconButton(
                   onPressed: (){
                     Navigator.pop(context);
                   },
                   icon: const Icon(Icons.arrow_back, color: Colors.white,),
                 )
             ),



           ],
         ),
       )
        :
    Scaffold(
      backgroundColor: Colors.black54,

      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),


        actions: <Widget>[
          popUpMenuVideo(Colors.white, postList[3])
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                AspectRatio(
                    aspectRatio: widget.controller.value.aspectRatio,
                  child:  Stack(
                      children:[
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          top: 0,
                          child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  widget.controller.value.isPlaying ?
                                  widget.controller.pause()
                                      :widget.controller.play();
                                });
                              },
                              child: PostVideo(controller: widget.controller)

                          ),
                        ),


                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            top: 0,
                            child: Center(
                              child: widget.controller.value.isPlaying ?
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
                                        widget.controller.value.isPlaying ?
                                        widget.controller.pause()
                                            :widget.controller.play();
                                      });
                                    },
                                    icon:  const Icon(
                                      Icons.play_arrow,
                                      size: 25,
                                      color: Colors.white70,
                                    )
                                ),
                              ),
                            )
                        ),


                        Positioned(
                            bottom: 5,
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
                                    setState(() {
                                      _landScape();
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.open_in_full_sharp,
                                    size: 15,
                                    color: Colors.white70,

                                  )
                              ),
                            )
                        )

                      ]
                  ),
                ),

                const SizedBox(height: 15,),

                progress(widget.controller),

                const SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueListenableBuilder(
                      valueListenable:widget.controller,
                      builder: (context, VideoPlayerValue value, child) {
                        //Do Something with the value.
                        return Text(
                          "0${value.position.inMinutes.toString()} : ${value.position.inSeconds.toString()} ",
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        );
                      },
                    ),
                    Text(
                      "0${widget.controller.value.duration.inMinutes} : ${widget.controller.value.duration.inSeconds}",
                      style: const TextStyle(
                          color: Colors.white
                      ),

                    )
                  ],
                )


              ],
            )
        ),
      ),
    );
  }
}

Widget progress(VideoPlayerController _controller) => VideoProgressIndicator(
    _controller,
    allowScrubbing: true,
    colors: const VideoProgressColors(playedColor: Colors.green, backgroundColor: Colors.grey),
    padding: const EdgeInsets.only(top: 20)
);
