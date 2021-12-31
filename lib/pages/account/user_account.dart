import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {

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
        backgroundColor: Colors.white,
        title: const Text("Account", style: TextStyle(color: Colors.black54),),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black54,),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Column(
          children: [

            InkWell(
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
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:   _image != null ? FadeInImage(
                      placeholder: const AssetImage(
                          "assets/images/placeholder1.png"
                      ),
                      image:   FileImage(_image!),
                      fit: BoxFit.cover,
                    ): const FadeInImage(
                      placeholder: AssetImage(
                          "assets/images/placeholder1.png"
                      ),
                      image: AssetImage(
                          "assets/images/placeholder1.png"
                      ),
                    ),
                  ),



                  const SizedBox(height: 15,),

                  const Text(
                    "Paul Lee",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu',
                      fontSize: 19
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
