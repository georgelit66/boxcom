import 'dart:io';

import 'package:boxcom/models/user_model.dart';
import 'package:boxcom/pages/home_page/home_page.dart';
import 'package:boxcom/widgets/form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  TextEditingController surnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();


  int? state ;
  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }


  int _activeStepIndex = 0;


  List<Step> stepList() => [
    Step(
      state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 0,
      title: const Text('Basic Info'),
      content: Column(
        children: [

          const SizedBox(height: 10,),
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
                      shape: BoxShape.circle,
                    ),
                    child: _image != null ? ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: FadeInImage(
                        placeholder: const AssetImage(
                            "assets/images/placeholder1.png"
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

          const SizedBox(height: 10,),

          MyFormField(
              controller: nameController,
              hint: 'Name',
              maxLines: 1,
              icon:const Icon(Icons.person, color: Colors.black54)
          ),

          MyFormField(
              controller: nameController,
              hint: 'Surname',
              maxLines: 1,
              icon:const Icon(Icons.person, color: Colors.black54,)
          ),


          MyFormField(
              controller: passwordController,
              hint: 'Password',
              maxLines: 1,
              icon:const Icon(Icons.lock, color: Colors.black54,)
          ),

          Row(
            children: [

              Expanded(
                child:  MyFormField(
                    controller: birthDateController,
                    hint: 'Date of Birth',
                    maxLines: 1,
                    icon:const Icon(Icons.calendar_today, color: Colors.black54,)
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
                        birthDateController.text =  "${value!.day}/${value!.month}/${value!.year}";
                      })
                    });
                  },
                  icon: const Icon(Icons.calendar_today)
              )
            ],
          ),

          const SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                AppLocalizations.of(context)!.alreadyHaveAccount,
                style: const TextStyle(
                  fontSize: 17,

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
              ),


            ],
          ),
          const SizedBox(height: 25,),




        ],
      ),
    ),
    Step(
        state:
        _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text('Address'),
        content: Column(
          children: [


            MyFormField(
              controller:  countryController,
              hint: "Country",
              maxLines: 1,
              icon: const Icon(Icons.location_on, color: Colors.black54,),
            ),







            MyFormField(
                controller: townController,
                hint: 'Town',
                maxLines: 1,
                icon: const Icon(Icons.location_on, color: Colors.black54)
            ),




            MyFormField(
                controller: phoneController,
                hint: 'Telephone',
                maxLines: 1,
                icon: const Icon(Icons.phone, color: Colors.black54)
            ),

            MyFormField(
                controller: nameController,
                hint: 'Email',
                maxLines: 1,
                icon:const Icon(Icons.email, color: Colors.black54,)
            ),


            MyFormField(
                controller: genderController,
                hint: 'Gender',
                maxLines: 1,
                icon:const  Icon(Icons.person, color: Colors.black54)
            ),





            const SizedBox(height: 20,),


            const SizedBox(height: 25,),

          ],
        )
    ),

  ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _activeStepIndex,
          steps: stepList(),
          onStepContinue: () {
            if (_activeStepIndex < (stepList().length - 1)) {
              setState(() {
                _activeStepIndex += 1;
              });
            } else {
              var name = nameController.value.text;
              var town =townController.value.text;
              var country = countryController.value.text;
              var surname= surnameController.value.text;
              var gender = genderController.value.text;
              var id = phoneController.value.text;


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

              Navigator.push(context, MaterialPageRoute(builder: (_)=> const MainHomePage()));

            }
          },
          onStepCancel: () {
            if (_activeStepIndex == 0) {
              return;
            }

            setState(() {
              _activeStepIndex -= 1;
            });
          },
          onStepTapped: (int index) {
            setState(() {
              _activeStepIndex = index;
            });
          },
          controlsBuilder: (context, {onStepContinue, onStepCancel}) {
            final isLastStep = _activeStepIndex == stepList().length - 1;
            return Row(
              children: [
                Expanded(
                    child: InkWell(
                      onTap: () async{
                        try{
                          onStepContinue!();


                        } catch(e){
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

                        child: Center(
                          child: (isLastStep)
                              ? const Text('Sign Up',  style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),)
                              : const Text('Next',  style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )),
                        ),
                      ),
                    )
                ),


                const SizedBox(
                  width: 10,
                ),
                if (_activeStepIndex > 0)
                  Expanded(
                      child: InkWell(
                        onTap: () async{
                          try{
                            onStepContinue!();


                          } catch(e){
                            print(e);
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
                            child :Text('Back', style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            )),
                          ),
                        ),
                      )
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
