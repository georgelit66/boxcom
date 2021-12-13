import 'package:boxcom/models/boutique_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoutiqueEdit extends StatefulWidget {
  const BoutiqueEdit({Key? key, required this.boutique}) : super(key: key);

 final Boutique boutique;

  @override
  _BoutiqueEditState createState() => _BoutiqueEditState();
}

class _BoutiqueEditState extends State<BoutiqueEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.boutique.name,
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
                              offset: const Offset(0,10)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              widget.boutique.imgUrl,
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
              initialValue: widget.boutique.name,
              decoration: const InputDecoration(
                labelText: "Boutique name",
                helperStyle:  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 10.0,),

            TextFormField(
              initialValue: widget.boutique.address,
              decoration: const InputDecoration(
                labelText: "Boutique location",
                helperStyle:  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),

            ),

            const SizedBox(height: 10.0,),

            TextFormField(
              initialValue:  widget.boutique.telephone,
              decoration: InputDecoration(
                labelText: "Boutique Phone",
                hintText: widget.boutique.telephone,
                helperStyle:  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),

            ),

            const SizedBox(height: 10.0,),
            TextFormField(
              initialValue: widget.boutique.boutique_sector,
              decoration: InputDecoration(
                labelText: "Boutique description",
                hintText: widget.boutique.boutique_sector,
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
                          border: Border.all(color:  Theme.of(context).primaryColor),
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
      ),
    );
  }
}
