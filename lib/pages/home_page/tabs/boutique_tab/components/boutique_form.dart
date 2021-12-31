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

  int _activeStepIndex = 0;


  List<Step> stepList() => [
    Step(
      state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 0,
      title: const Text('Basic Info'),
      content: Column(
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

          const SizedBox(height: 20),



          MyFormField(
              controller:  creatorController,
              hint: "Creator",
              maxLines: 1,
              icon: const Icon(Icons.person, color: Colors.black54,),
          ),


          MyFormField(
            controller:tagController,
            hint: "Tag",
            maxLines: 1,
            icon: const Icon(Icons.email, color: Colors.black54,),
          ),



          MyFormField(
            controller:  boutiqueNameController,
            hint: "Boutique Name",
            maxLines: 1,
            icon: const Icon(Icons.email, color: Colors.black54,),
          ),



          MyFormField(
            controller: domainController,
            hint: "Boutique Domain",
            maxLines: 1,
            icon: const Icon(Icons.email, color: Colors.black54,),
          ),




          MyFormField(
            controller:  descriptionController,
            hint: "Boutique Domain",
            maxLines: 4,
            icon: const Icon(Icons.email, color: Colors.black54,),
          ),


        ],
      ),
    ),
    Step(
        state:
        _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text('Address'),
        content: Container(
          child: Column(
            children: [
              MyFormField(
                controller:  countryController,
                hint: "Country",
                maxLines: 1,
                icon: const Icon(Icons.location_on, color: Colors.black54,),
              ),







              MyFormField(
                controller:  townController,
                hint: "Town",
                maxLines: 1,
                icon: const Icon(Icons.location_on, color: Colors.black54,),
              ),




              MyFormField(
                controller:  addressController,
                hint: "Address",
                maxLines: 1,
                icon: const Icon(Icons.location_on, color: Colors.black54,),
              ),




              MyFormField(
                controller: telephoneController,
                hint: "Telephone",
                maxLines: 1,
                icon: const Icon(Icons.phone, color: Colors.black54,),
              ),


            ],
          ),
        )),
    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text('Extra Information'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [




            MyFormField(
              controller:  websiteController,
              hint: "Website",
              maxLines: 1,
              icon: const Icon(Icons.language, color: Colors.black54,),
            ),



            MyFormField(
              controller: openHourController,
              hint: "Open Hour",
              maxLines: 1,
              icon: const Icon(Icons.email, color: Colors.black54,),
            ),


            MyFormField(
              controller: closingHourController,
              hint: "Closing Hour",
              maxLines: 1,
              icon: const Icon(Icons.email, color: Colors.black54,),
            ),

            MyFormField(
              controller: emailController,
              hint: "Email",
              maxLines: 1,
              icon: const Icon(Icons.email, color: Colors.black54,),
            ),

            const SizedBox(height: 20,)




          ],
        ))
  ];

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: height * .06),
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
             Navigator.pop(context);
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
                            ? const Text('Create Boutique',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),)
                            : const Text('Next',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),
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
                          child :Text('Back',style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
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
