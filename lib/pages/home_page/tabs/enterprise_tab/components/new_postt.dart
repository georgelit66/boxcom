import 'package:boxcom/widgets/form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController enterpriseCategoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          SizedBox(height: 60,),

          myFormField(
              context,
              "id",
              const Icon(Icons.email, color: Colors.black54,),
              idController
          ),

          myFormField(
              context,
              "name",
              const Icon(Icons.email, color: Colors.black54,),
              nameController
          ),

          myFormField(
              context,
              "website",
              const Icon(Icons.email, color: Colors.black54,),
              websiteController
          ),
          myFormField(
              context,
              "telephone",
              const Icon(Icons.email, color: Colors.black54,),
              telephoneController
          ),

          myFormField(
              context,
              "location",
              const Icon(Icons.email, color: Colors.black54,),
              locationController
          ),


          myFormField(
              context,
              "description",
              const Icon(Icons.email, color: Colors.black54,),
              descriptionController
          ),

          myFormField(
              context,
              "category",
              const Icon(Icons.email, color: Colors.black54,),
              enterpriseCategoryController
          ),

          myFormField(
              context,
              "country",
              const Icon(Icons.email, color: Colors.black54,),
              countryController
          ),

















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
                        border: Border.all(color: Colors.green),
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
                        color: Colors.green,
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

    );
  }
}
