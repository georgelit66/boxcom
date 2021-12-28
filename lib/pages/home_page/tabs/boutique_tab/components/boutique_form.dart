import 'dart:io';

import 'package:boxcom/widgets/form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BoutiqueForm extends StatefulWidget {
  const BoutiqueForm({Key? key}) : super(key: key);

  @override
  _BoutiqueFormState createState() => _BoutiqueFormState();
}

class _BoutiqueFormState extends State<BoutiqueForm> {

  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }


  TextEditingController creatorController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController boutiqueNameController = TextEditingController();
  TextEditingController domainController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController openHourController = TextEditingController();
  TextEditingController closingHourController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: height * .06,),
            InkWell(
                onTap: getImage,
                child:  CircleAvatar(
                  backgroundImage: const AssetImage(
                      "assets/products/house4.png"
                  ),
                  foregroundImage: _image != null ? FileImage(_image!) : FileImage(File.fromUri(Uri.parse("ff"))),
                  radius: 70,
                )
            ),

            myFormField(
                context,
                "creator",
                const Icon(Icons.email, color: Colors.black54,),
                creatorController,
              1
            ),

            myFormField(
                context,
                "Tag",
                const Icon(Icons.email, color: Colors.black54,),
                tagController,
              1
            ),

            myFormField(
                context,
                "Boutique Name",
                const Icon(Icons.email, color: Colors.black54,),
                boutiqueNameController,
                1
            ),
            myFormField(
                context,
                "Boutique Domain",
                const Icon(Icons.email, color: Colors.black54,),
                domainController,
               1
            ),



            myFormField(
                context,
                "Description",
                const Icon(Icons.email, color: Colors.black54,),
                descriptionController,
                4
            ),
            myFormField(
                context,
                "Country",
                const Icon(Icons.email, color: Colors.black54,),
                countryController,
                1
            ),

            myFormField(
                context,
                "Town",
                const Icon(Icons.email, color: Colors.black54,),
                townController,
                1
            ),


            myFormField(
                context,
                "Address",
                const Icon(Icons.email, color: Colors.black54,),
                addressController,
              1
            ),


            myFormField(
                context,
                "Website",
                const Icon(Icons.email, color: Colors.black54,),
                websiteController,
               1
            ),

            myFormField(
                context,
                "open Hour",
                const Icon(Icons.email, color: Colors.black54,),
                openHourController,
              1
            ),

            myFormField(
                context,
                "closing Hour",
                const Icon(Icons.email, color: Colors.black54,),
                closingHourController,
              1
            ),

            myFormField(
                context,
                "Telephone",
                const Icon(Icons.email, color: Colors.black54,),
                telephoneController,
              1
            ),

            myFormField(
                context,
                "Email",
                const Icon(Icons.email, color: Colors.black54,),
                emailController,
              1
            ),




            const SizedBox(height: 15,),

            MaterialButton(
                onPressed: () async{

                  try{

                    Navigator.pop(context);

                  } catch(e){
                    print("There was an error at $e");
                  }

                },

                child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16.0)
                    ),
                    child:  const Center(
                      child: Text(
                        "Create Boutique",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                    )
                )
            ),

            const SizedBox(height: 20,)



          ],
        ),
      ),
    );
  }
}