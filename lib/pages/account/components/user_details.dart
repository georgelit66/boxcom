import 'package:boxcom/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        elevation: 10,
        title: Text("${widget.user.name} ${widget.user.surname}"),
      ),
      body: Column(

        children: [

         Row(

           children: [
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
               child: CircleAvatar(
                 backgroundImage:
                 const AssetImage("assets/images/placeholder1.png"),
                 foregroundImage:AssetImage(widget.user.photo!),
                 radius: 60.0,
               ),
             ),

             const SizedBox(width: 20,),
             
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(height: 8.0,),
                 Row(
                   children:  [
                     const Icon(
                       Icons.person,
                       size: 20,
                     ),
                     const SizedBox(width: 5.0,),
                     Text(
                       "${widget.user.name} ${widget.user.surname}",
                       style: const TextStyle(
                           fontSize: 15
                       ),
                     ),
                   ],
                 ),

                 const SizedBox(height: 10.0,),

                 Row(
                   children:  [
                     const Icon(
                       Icons.phone,
                       size: 20,
                     ),
                     const SizedBox(width: 5.0,),
                     Text(
                       widget.user.telephone,
                       style: const TextStyle(
                           fontSize: 15
                       ),
                     ),
                   ],
                 ),

                 const SizedBox(height: 10.0,),
                 Row(
                   children:   [
                     const Icon(
                       Icons.location_on,
                       size: 20,
                     ),
                     const SizedBox(width: 8.0,),
                     Text(
                       widget.user.country,
                       style: const TextStyle(
                           fontSize: 15
                       ),
                     ),
                   ],
                 ),

                 const SizedBox(height: 10.0),
                 Row(
                   children:   [
                     const Icon(
                       Icons.email,
                       size: 20,
                     ),
                     const SizedBox(width: 8.0,),
                     Text(
                       widget.user.email,
                       style: const TextStyle(
                           fontSize: 15
                       ),
                     ),
                   ],
                 ),



               ],)


           ],
         )


        ],
      ),
    );
  }
}
