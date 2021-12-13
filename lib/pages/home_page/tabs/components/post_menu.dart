import 'package:boxcom/models/enum/post_type.dart';
import 'package:boxcom/models/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget postDialog(){
  return SimpleDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0)
    ),
    title: const Text("Post Options"),
    children: <Widget>[
      SimpleDialogOption(
        onPressed: (){},
        child: Row(
          children: const [
            Icon(Icons.logout),
            SizedBox(width: 10,),
            Text("Se dessabonne")
          ],
        ),
      ),

      SimpleDialogOption(
        onPressed: (){},
        child: Row(
          children: const [
            Icon(Icons.error_outline),
            SizedBox(width: 10,),
            Text("Signale")
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: (){},
        child: Row(
          children: const [
            Icon(Icons.download_outlined),
            SizedBox(width: 10,),
            Text("Telecharge la photo")
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: (){},
        child: Row(
          children: const [
            Icon(Icons.hide_source),
            SizedBox(width: 10,),
            Text("Masque la publication")
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: (){},
        child: Row(
          children: const [
            Icon(Icons.download_outlined),
            SizedBox(width: 10,),
            Text("Telecharge la photo")
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: (){},
        child: Row(
          children: const [
            Icon(Icons.bookmark_border),
            SizedBox(width: 10,),
            Text("Enregistrer la publication")
          ],
        ),
      )
    ],
  );



  }


Widget popUpMenuImage(Color color, Post post){
  return PopupMenuButton(
      icon:  Icon(Icons.more_vert, color: color),

      itemBuilder: (_) =>[
        PopupMenuItem(
          child: Column(
            children:  [
              Row(
                children: const [
                  Icon(
                    Icons.logout,
                    color: Colors.black87,
                  ),
                  SizedBox(width: 10,),
                  Text("Se dessabonne"),
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(thickness: .75, height: 0.75, color: Colors.black26,)
            ],
          ),
        ),


        PopupMenuItem(
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.error_outline,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 10,),
                    Text("Signale")
                  ],
                ),
                const SizedBox(height: 10,),
                const Divider(thickness: .75, height: 0.75, color: Colors.black26,)
              ],
            )
        ),
        PopupMenuItem(
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.download_outlined,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 10,),
                    Text("Telecharge la photo")
                  ],
                ),
                const SizedBox(height: 10,),
                const Divider(thickness: .75, height: 0.75, color: Colors.black26,)
              ],
            )
        ),
        PopupMenuItem(
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.hide_source,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 10,),
                    Text("Masque la publication")
                  ],
                ),
                const SizedBox(height: 10,),
                const Divider(thickness: .75, height: 0.75, color: Colors.black26,)
              ],
            )
        ),
        if(post.postType == PostType.product) PopupMenuItem(
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.bookmark_border,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 10,),
                    Text("Enregistrer le produit")
                  ],
                ),
                const SizedBox(height: 10,),
                const Divider(thickness: .75, height: 0.75, color: Colors.black26,)
              ],
            )
        ),
        PopupMenuItem(
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.bookmark_border,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 10,),
                    Text("Enregistrer la publication")
                  ],
                ),
                const SizedBox(height: 10,),
                const Divider(thickness: .75, height: 0.75, color: Colors.black26,)
              ],
            )
        ),
      ]
  );
}

Widget popUpMenuVideo(Color color , Post post){
  return PopupMenuButton(
    icon:  Icon(Icons.more_vert, color: color,),

      itemBuilder: (_) =>[
        PopupMenuItem(
            child: Column(
              children:  [
               Row(
                 children: const [
                   Icon(
                       Icons.logout,
                       color: Colors.black87,
                   ),
                   SizedBox(width: 10,),
                   Text("Se dessabonne"),
                 ],
               ),
                const SizedBox(height: 10,),
                const Divider(thickness: .75, height: 0.75, color: Colors.black26,)
              ],
            ),
        ),


        PopupMenuItem(
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(
                      Icons.error_outline,
                      color: Colors.black87,
                  ),
                  SizedBox(width: 10,),
                  Text("Signale")
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(thickness: .75, height: 0.75, color: Colors.black26,)
            ],
          )
        ),

        PopupMenuItem(
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(
                      Icons.hide_source,
                      color: Colors.black87,
                  ),
                  SizedBox(width: 10,),
                  Text("Masque la publication")
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(thickness: .75, height: 0.75, color: Colors.black26,)
            ],
          )
        ),


        if(post.postType == PostType.product) PopupMenuItem(
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.bookmark_border,
                      color: Colors.black87,
                    ),
                    SizedBox(width: 10,),
                    Text("Enregistrer le produit")
                  ],
                ),
                const SizedBox(height: 10,),
                const Divider(thickness: .75, height: 0.75, color: Colors.black26,)
              ],
            )
        ),
        PopupMenuItem(
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(
                      Icons.bookmark_border,
                      color: Colors.black87,
                  ),
                  SizedBox(width: 10,),
                  Text("Enregistrer la publication")
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(thickness: .75, height: 0.75, color: Colors.black26,)
            ],
          )
        ),
      ]
  );
}