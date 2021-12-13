import 'package:boxcom/models/post_model.dart';
import 'package:boxcom/pages/home_page/tabs/components/post_menu.dart';
import 'package:boxcom/widgets/image_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomePostZoom extends StatefulWidget {
  const HomePostZoom({Key? key, required this.post }) : super(key: key);

  final Post post;

  @override
  _HomePostZoomState createState() => _HomePostZoomState();
}

class _HomePostZoomState extends State<HomePostZoom> {


  var _showDescription = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child:  Scaffold(
        backgroundColor: Colors.black,
          appBar:  AppBar(
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
              popUpMenuImage(Colors.white, widget.post)
            ],
          ),

          body: Container(
            padding: const EdgeInsets.only(top: 8),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child:  Stack(
              alignment: Alignment.center,
                children: [

                SizedBox(
                        height: MediaQuery.of(context).size.height - 30,
                        child:  FutureBuilder(
                            future: imageInfo(widget.post.imageUrl!),
                            builder: (BuildContext context , AsyncSnapshot<Size> size){
                              if(size.hasData){
                                return size.data!.width - size.data!.height > 100  || size.data!.height - size.data!.width < 400 ?
                                Hero(
                                  tag: widget.post.name,
                                  child: InteractiveViewer(
                                    child: Image(
                                      image: AssetImage(
                                          widget.post.imageUrl!
                                      ),
                                      fit: BoxFit.fitWidth,

                                    ),
                                  ),
                                ):size.data!.height - size.data!.width> 400?

                                Hero(
                                  tag: widget.post.name,
                                  child: InteractiveViewer(
                                    child: Image(
                                      image: AssetImage(
                                          widget.post.imageUrl!
                                      ),
                                      fit: BoxFit.fitHeight,

                                    ),
                                  ),
                                ):

                                Hero(
                                  tag: widget.post.name,
                                  child: InteractiveViewer(
                                    child: Image(
                                      image: AssetImage(
                                          widget.post.imageUrl!
                                      ),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                );
                              }

                              else{

                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }


                            }
                        ),
                    ),






                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 160.0,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.black54,Colors.transparent],begin: Alignment.bottomCenter,end: Alignment.topCenter
                        ),),
                    ),
                  ),





                  Positioned(
                    bottom: 10,
                    right: 0,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          widget.post.name,
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
                        ),

                        const SizedBox(height: 5.0,),
                        Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _showDescription = !_showDescription;
                                });
                              },
                              child: !_showDescription ?  Text(
                                widget.post.description!,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white60
                                ),
                                maxLines: 2,
                                overflow:  TextOverflow.ellipsis ,
                              ) :  Text(
                                widget.post.description!,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70
                                ),
                                overflow:  TextOverflow.visible ,
                              ),
                            )
                        )
                      ],
                    ),
                  ),






                ],
            )
          )
      )
    );
  }
}
