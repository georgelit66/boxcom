import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PostVideo extends StatefulWidget {
  const PostVideo({Key? key, required this.controller}) : super(key: key);


  final VideoPlayerController controller;

  @override
  _PostVideoState createState() => _PostVideoState();
}

class _PostVideoState extends State<PostVideo> {



  @override
  Widget build(BuildContext context) {



    return Stack(
      children: [


        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child:  VideoPlayerWidget(controller:  widget.controller)
        ),



      ],
    );
  }
}


class VideoPlayerWidget extends StatelessWidget {

  final VideoPlayerController controller;
  const VideoPlayerWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? Container(
      alignment: Alignment.topCenter,
      child: buildVideo(controller),
    )
        :
    const Center(
      child: CircularProgressIndicator(),
    );
  }
}

Widget buildVideo( VideoPlayerController controller) => VideoPlayer(controller);


