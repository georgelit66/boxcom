import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

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
          elevation: 10,
          centerTitle: true,
          title: const Text("My Account"),
          leading: IconButton(
            icon: const Icon(
                Icons.arrow_back,
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


              Center(
                child:   InkWell(
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
                          shape: BoxShape.circle,
                        ),
                        child: _image != null ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: FadeInImage(
                            placeholder: const AssetImage(
                                "assets/images/person.jpg"
                            ),
                            image:   FileImage(_image!),
                            fit: BoxFit.cover,
                          ),
                        ): ClipRRect(
                          borderRadius: BorderRadius.circular(100),
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

              ),

              TextFormField(
                initialValue:  "Pual Lee",
                decoration: const InputDecoration(
                  labelText: "Enterprise name",
                  hintText: "Name",
                  helperStyle:  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),

              const SizedBox(height: 10.0,),

              TextFormField(
                initialValue: "Yaounde",
                decoration: const InputDecoration(
                  labelText: "location",
                  hintText: "Town",
                  helperStyle:  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),
                ),

              ),

              const SizedBox(height: 10.0,),

              TextFormField(
                initialValue: "3458490903",
                decoration: const InputDecoration(
                  labelText: "Phone",
                  hintText: "Phone",
                  helperStyle:  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),
                ),

              ),

              const SizedBox(height: 10.0,),

              TextFormField(
                initialValue: "Cameroon",
                decoration: const InputDecoration(
                  labelText: "Country",
                  hintText: "Country",
                  helperStyle:  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),
                ),

              ),

              const SizedBox(height: 25.0,),




            ],
          ),
        )
    );
  }
}
