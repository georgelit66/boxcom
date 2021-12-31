import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';



class NewBoutiqueProduct extends StatefulWidget {
  const NewBoutiqueProduct({Key? key}) : super(key: key);

  @override
  _NewBoutiqueProductState createState() => _NewBoutiqueProductState();
}

class _NewBoutiqueProductState extends State<NewBoutiqueProduct> {

  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title: const Text("New Product"),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            left: 16,
            top: 25,
            right: 16
        ),
        child: ListView(
          children: [


            Center(
              child:  InkWell(
                onTap: getImage,
                child: Stack(
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
                          shape: BoxShape.rectangle,
                        ),
                        child: _image != null ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            placeholder: const AssetImage(
                                "assets/images/placeholder1.png"
                            ),
                            image:   FileImage(_image!),
                            fit: BoxFit.cover,
                          ),
                        ): ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const FadeInImage(
                            placeholder: AssetImage(
                                "assets/images/placeholder1.png"
                            ),
                            image: AssetImage(
                                "assets/images/placeholder1.png"
                            ),
                            fit: BoxFit.cover,
                          ),
                        )
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
                              shape: BoxShape.rectangle
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
            ),

            TextFormField(
              decoration:  InputDecoration(
                labelText: AppLocalizations.of(context)!.productTitle,
                hintText: AppLocalizations.of(context)!.productTitle,
                helperStyle:  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),

            const SizedBox(height: 10.0,),

            TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.productPrice,
                hintText:  AppLocalizations.of(context)!.productPrice,
                helperStyle:  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),

            ),

            const SizedBox(height: 10.0,),

            TextFormField(
              decoration: InputDecoration(
                labelText:  AppLocalizations.of(context)!.productDescription,
                hintText:  AppLocalizations.of(context)!.productDescription,
                helperStyle:  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),

            ),

            const SizedBox(height: 10.0,),

            TextFormField(
              decoration: InputDecoration(
                labelText:  AppLocalizations.of(context)!.productCategory,
                hintText: AppLocalizations.of(context)!.productCategory,
                helperStyle:  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),

            ),

            const SizedBox(height: 10.0,),

            TextFormField(
              decoration: InputDecoration(
                labelText:  AppLocalizations.of(context)!.productSubCategory,
                hintText: AppLocalizations.of(context)!.productSubCategory,
                helperStyle:  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
              ),

            ),

            const SizedBox(height: 25.0,),

            InkWell(
              onTap: () async{

                Navigator.pop(context);
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width  * .65,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [
                          Colors.cyan,
                          Colors.cyanAccent
                        ]
                    ),
                    borderRadius: BorderRadius.circular(30)
                ),

                child: const Center(
                  child: Text(
                    "Add Product",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                    ),
                  ),
                ),
              ),
            ),


            const SizedBox(height: 25.0,),


          ],
        ),
      ),
    );
  }
}
