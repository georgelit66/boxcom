import 'package:boxcom/models/enterprise_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class EnterpriseEdit extends StatefulWidget {
  const EnterpriseEdit({Key? key, required this.enterprise}) : super(key: key);

  final Enterprise enterprise;

  @override
  _EnterpriseEditState createState() => _EnterpriseEditState();
}

class _EnterpriseEditState extends State<EnterpriseEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.enterprise.name,
          style: const TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.w700
          ),
        ),
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back,
              color: Colors.black
          ),
          onPressed: () {
            Navigator.pop(context);

          },
        ),
      ),

      body: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 25,
          right: 16
        ),
        child: ListView(
          children: [
            const Text(
              "Edit Profile",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700
              ),
            ),

           const SizedBox(height: 15.0,),


           Center(
             child:  Stack(
               children: [
                 Container(
                   width: 140,
                   height: 140,
                   decoration: BoxDecoration(
                     border: Border.all(
                       width: 4.0,
                       color: Theme.of(context).backgroundColor
                     ),
                       boxShadow: [
                         BoxShadow(
                           spreadRadius: 2,
                           blurRadius: 10,
                           color: Colors.black.withOpacity(0.1),
                           offset: Offset(0,10)
                         )
                       ],
                       shape: BoxShape.circle,
                       image:  DecorationImage(
                           image: AssetImage(
                           widget.enterprise.image
                           ),
                           fit: BoxFit.cover
                       )
                   ),
                 ),


                 Positioned(
                   right: 0,
                     bottom: 0,
                     child: Container(
                       height: 40,
                       width: 50,
                       decoration: BoxDecoration(
                           border: Border.all(
                               width: 4.0,
                               color: Theme.of(context).backgroundColor
                           ),
                         color: Theme.of(context).primaryColor,
                         shape: BoxShape.circle
                       ),


                       child: const Icon(
                           Icons.linked_camera,
                          color: Colors.white,
                       ),
                     )
                 )
               ],
             ),
           ),

            TextFormField(
              initialValue:  widget.enterprise.name,
              decoration: InputDecoration(
                labelText: "Enterprise name",
                hintText: widget.enterprise.name,
                helperStyle:  const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),

            const SizedBox(height: 10.0,),

           TextFormField(
             initialValue: widget.enterprise.ville,
              decoration: InputDecoration(
                labelText: "location",
                hintText: widget.enterprise.ville,
                helperStyle:  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),

            ),

            const SizedBox(height: 10.0,),

            TextFormField(
              initialValue: widget.enterprise.website ,
              decoration: InputDecoration(
                labelText: "Enterprise website",
                hintText: widget.enterprise.website,
                helperStyle:  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),

            ),

            const SizedBox(height: 10.0,),
            TextFormField(
              initialValue: widget.enterprise.telephone,
              decoration: InputDecoration(
                labelText: "Enterprise phone ",
                hintText: widget.enterprise.telephone,
                helperStyle:  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),

            ),

            const SizedBox(height: 10.0,),

            TextFormField(
              initialValue:widget.enterprise.description,
              decoration: InputDecoration(
                labelText: "Enterprise description",
                hintText: widget.enterprise.description,
                helperStyle:  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),

            ),

             const SizedBox(height: 25.0,),


             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [

                   GestureDetector(
                     onTap: (){
                       Navigator.pop(context);
                     },
                     child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       decoration: BoxDecoration(
                           border: Border.all(color:Theme.of(context).indicatorColor),
                           borderRadius: BorderRadius.circular(15.0)
                       ),
                       child: const Text(
                         "Cancel",
                         style: TextStyle(
                             color: Colors.black87,
                             fontSize: 16,
                             fontWeight: FontWeight.w600
                         ),
                       ),
                     ),
                   ),


                   GestureDetector(
                     onTap: (){

                     },
                     child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                       decoration: BoxDecoration(
                           color: Theme.of(context).primaryColor,
                           borderRadius: BorderRadius.circular(15.0)
                       ),
                       child: const Text(
                         "Save",
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 16,
                             fontWeight: FontWeight.w600
                         ),
                       ),
                     ),
                   )

                 ],
               ),
            )

          ],
        ),
      )
    );
  }
}
