import 'package:boxcom/models/enterprise_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoZoom extends StatefulWidget {
  const PhotoZoom({Key? key, required this.enterprise}) : super(key: key);

  final Enterprise enterprise;

  @override
  _PhotoZoomState createState() => _PhotoZoomState();
}

class _PhotoZoomState extends State<PhotoZoom> {

  var _showDescription = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height - 30,
              child: Hero(
                tag: (widget.enterprise.telephone),
                child: Image(
                  image: AssetImage(""),
                  fit: BoxFit.cover,
                ),
              )
          ),


          Positioned(
           top: 0,
            left: 0,
            right: 0,
            child:   Container(
              height: 80.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.black54,Colors.transparent],begin: Alignment.bottomCenter,end: Alignment.topCenter
                ),),
            ),
          ),


        Positioned(
          top: 25,
          left: 20,
            child:
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
        ),



        Positioned(
          top: 25,
            right: 10,
            child:  Row(
              children: [

                IconButton(
                  icon: const Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {

                  },
                ),
                const SizedBox(width: 5.0,),

                IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onPressed: () {

                  },
                ),




              ],
            )
        ),

        Positioned(
          bottom: 0,
            left: 0,
            right: 0,
            child:   Container(
              height: 160.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.black54,Colors.transparent],begin: Alignment.bottomCenter,end: Alignment.topCenter
                ),),
            ),
        ),

          Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    widget.enterprise.name,
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
                        widget.enterprise.description,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white60
                        ),
                        maxLines: 2,
                        overflow:  TextOverflow.ellipsis ,
                      ) :  Text(
                        widget.enterprise.description,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70
                        ),
                        overflow:  TextOverflow.visible ,
                      ),
                    )
                  )
                ],
              )
          ),


        ],
      )
    );
  }
}
