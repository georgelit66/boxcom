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
              child:  CircleAvatar(
                backgroundImage: const AssetImage(
                    "assets/products/house4.png"
                ),
                foregroundImage: _image != null ? FileImage(_image!) : FileImage(File.fromUri(Uri.parse("ff"))),
                radius: 70,
              )
          ),

          FormField(
              context,
              "creator",
              const Icon(Icons.email, color: Colors.black54,),
              creatorController,
              1
          ),

          FormField(
              context,
              "Tag",
              const Icon(Icons.email, color: Colors.black54,),
              tagController,
              1
          ),

          FormField(
              context,
              "Boutique Name",
              const Icon(Icons.email, color: Colors.black54,),
              boutiqueNameController,
              1
          ),
          FormField(
              context,
              "Boutique Domain",
              const Icon(Icons.email, color: Colors.black54,),
              domainController,
              1
          ),



          FormField(
              context,
              "Description",
              const Icon(Icons.email, color: Colors.black54,),
              descriptionController,
              4
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
              FormField(
                  context,
                  "Country",
                  const Icon(Icons.email, color: Colors.black54,),
                  countryController,
                  1
              ),

              FormField(
                  context,
                  "Town",
                  const Icon(Icons.email, color: Colors.black54,),
                  townController,
                  1
              ),


              FormField(
                  context,
                  "Address",
                  const Icon(Icons.email, color: Colors.black54,),
                  addressController,
                  1
              ),

              FormField(
                  context,
                  "Telephone",
                  const Icon(Icons.email, color: Colors.black54,),
                  telephoneController,
                  1
              ),


            ],
          ),
        )),
    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text('Confirm'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FormField(
                context,
                "Website",
                const Icon(Icons.email, color: Colors.black54,),
                websiteController,
                1
            ),

            FormField(
                context,
                "open Hour",
                const Icon(Icons.email, color: Colors.black54,),
                openHourController,
                1
            ),

            FormField(
                context,
                "closing Hour",
                const Icon(Icons.email, color: Colors.black54,),
                closingHourController,
                1
            ),


            FormField(
                context,
                "Email",
                const Icon(Icons.email, color: Colors.black54,),
                emailController,
                1
            ),




          ],
        ))
  ];

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: height * .6),
        child: Stepper(
          type: StepperType.vertical,
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
            return Container(
              child: Row(
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
                              ? const Text('Create Boutique')
                              : const Text('Next'),
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
                            child :Text('Back'),
                          ),
                        ),
                      )
                    )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
