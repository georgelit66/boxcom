import 'package:boxcom/data/database/database.dart';
import 'package:boxcom/models/user_model.dart';
import 'package:boxcom/pages/home_page/home_page.dart';
import 'package:boxcom/widgets/form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController surnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController idController = TextEditingController();



  int? state ;
  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              myFormField(
                  context,
                  "Name",
                  const Icon(Icons.person, color: Colors.black54,),
                  idController,
                 1
              ),

              myFormField(
                  context,
                  "Surname",
                  const Icon(Icons.person, color: Colors.black54,),
                  nameController,
                1
              ),

              myFormField(
                  context,
                  "Password",
                  const Icon(Icons.email, color: Colors.black54,),
                  genderController,1
              ),

              Row(
                children: [

                  Expanded(
                    child: myFormField(
                        context,
                        "Date of Birth",
                        const Icon(Icons.calendar_today, color: Colors.black54,),
                      genderController,
                      1
                    ),
                  ),

                  const SizedBox(width: 10,),

                  IconButton(
                      onPressed: (){
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2018),
                            lastDate: DateTime(2030)
                        ).then((value) => {
                          setState(() {

                          })
                        });
                      },
                      icon: const Icon(Icons.calendar_today)
                  )
                ],
              ),

              myFormField(
                  context,
                  "Country",
                  const Icon(Icons.password, color: Colors.black54,),
                  townController,1
              ),


              myFormField(
                  context,
                  "Telephone",
                  const Icon(Icons.password, color: Colors.black54,),
                  countryController,1
              ),



              myFormField(
                  context,
                  "gender",
                  const Icon(Icons.email, color: Colors.black54,),
                  genderController,1
              ),





              const SizedBox(height: 20,),


              InkWell(
                onTap: () async{
                  var name = nameController.value.text;
                  var town =townController.value.text;
                  var country = countryController.value.text;
                  var surname= surnameController.value.text;
                  var gender = genderController.value.text;
                  var id = idController.value.text;


                  var user = User(
                      telephone: id,
                      name: name,
                      surname: surname,
                      gender: gender,
                      town: town,
                      country: country,
                      password: "",
                      email: '',
                      dateOfBirth: DateTime.now()
                  );

                  try{



                  } catch(e){
                    print("There was an error at $e");
                  }


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
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 25,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text(
                    "Already have an Account ?",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54
                    ),
                  ),

                  const SizedBox(width: 15,),


                  InkWell(
                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (_)=>  const LoginForm()));

                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.cyan
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
