import 'package:boxcom/data/enterprises.dart';
import 'package:boxcom/models/user_model.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/components/enterprise_search.dart';
import 'package:boxcom/repositories/enterprise_repository.dart';
import 'package:boxcom/pages/home_page/tabs/components/list_enterprises_boutiques_item.dart';
import 'package:boxcom/widgets/form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'components/sort_enterprise.dart';


class EnterpriseTab extends StatefulWidget {
  const EnterpriseTab({Key? key}) : super(key: key);



  @override
  _EnterpriseTabState createState() => _EnterpriseTabState();
}

class _EnterpriseTabState extends State<EnterpriseTab> {
  
  
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController enterpriseCategoryController = TextEditingController();

  
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {


    final enterpriseData = Get.put(EnterpriseRepository());

    return Scaffold(
      body: Column(
        children: [

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Enterprises",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.black54
                      ),
                    ),

                    Row(
                      children: [
                        IconButton(
                            onPressed: (){},
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.black54,
                            )
                        ),

                        const SizedBox(width: 5.0,),

                        IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnterpriseSearch()));
                            },
                            icon:const Icon(
                              Icons.search,
                              color: Colors.black54,
                            )
                        ),
                        const SizedBox(width: 5.0,),
                         EnterpriseSort()


                      ],
                    )
                  ],
                ),
              ),



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                    height: 67.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [


                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _selectedIndex = 0;
                            });

                          },
                          child: Container(
                              height: 40.0,
                              width: MediaQuery.of(context).size.width / 2 -30,
                              decoration: BoxDecoration(
                                  gradient:  _selectedIndex == 0 ?
                                 LinearGradient(
                                      colors: [
                                        Theme.of(context).indicatorColor,
                                        Theme.of(context).primaryColor
                                      ]
                                  ):const LinearGradient(
                                      colors: [
                                        Colors.grey,
                                        Colors.black26
                                      ]
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)
                              ),

                              child: const Center(
                                child:  Text(
                                  "Abonnements",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                          ),

                        ),


                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _selectedIndex = 1;
                            });

                          },
                          child:  Container(
                              height: 40.0,
                              width: MediaQuery.of(context).size.width / 2 -30,
                              decoration: BoxDecoration(
                                  color:_selectedIndex == 1 ?
                                  Theme.of(context).primaryColor
                                      :Colors.grey,
                                  borderRadius: BorderRadius.circular(30.0)
                              ),

                              child: const Center(
                                child:  Text(
                                  "Mes Entreprises",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                          ),

                        ),


                      ],
                    )
                ),
              ),

            ],
          ),




          Expanded(
            flex: 4,
            child: _selectedIndex == 0?
            ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemCount:enterprises.length,
                itemBuilder: (BuildContext context, int index){
                  var enterprise = enterprises[index];
                  return EnterpriseTile(enterprise: enterprise);
                }
            )
           : ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemCount:enterprises.length,
                itemBuilder: (BuildContext context, int index){
                  var enterprise = enterprises[index];
                  return myEnterpriseTile(enterprise, context);
                }
            )
          )

        ],
      ),

        floatingActionButton: _selectedIndex == 1 ?   FloatingActionButton(
          onPressed: (){

            showDialog(
                context: context,
                builder: (BuildContext context){
                  return Card(
                    child: Column(
                      children: [

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


                        const SizedBox(height: 15,),

                        MaterialButton(
                            onPressed: () async{
                              var id = idController.value.text;
                              var name = nameController.value.text;
                              var website =websiteController.value.text;
                              var location = locationController.value.text;
                              var description= descriptionController.value.text;
                              var category = enterpriseCategoryController.value.text;
                              var country = countryController.value.text;
                              var telephone = telephoneController.value.text;

                              try{

                              } catch(e){
                                print("There was an error at $e");
                              }

                            },

                          child:  Text(
                            "Create enterprise",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor
                            ),
                          ),
                        )



                  ],
                    ),
                  );
                }
            );

          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        ): Container()
    );
  }
}
