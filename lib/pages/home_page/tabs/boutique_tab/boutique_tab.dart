import 'package:boxcom/pages/home_page/tabs/boutique_tab/components/boutique_search.dart';
import 'package:boxcom/repositories/boutique_repository.dart';
import 'package:boxcom/pages/home_page/tabs/components/list_enterprises_boutiques_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/sort_boutique.dart';

class BoutiqueTab extends StatefulWidget {
  const BoutiqueTab({Key? key}) : super(key: key);

  @override
  _BoutiqueTabState createState() => _BoutiqueTabState();
}

class _BoutiqueTabState extends State<BoutiqueTab> {



var _selectedIndex = 0;

@override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final boutiqueData = Get.put(BoutiqueRepository().fetchBoutiques());

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
                      "Boutiques",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.black54
                      ),
                    ),

                    Row(
                      children: [
                        IconButton(
                            onPressed: (){

                            },
                            icon: const Icon(
                                Icons.settings,
                                color: Colors.black54
                            )
                        ),

                        const SizedBox(width: 5.0,),

                        IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const BoutiqueSearch()));
                            },
                            icon: const Icon(
                                Icons.search,
                                color: Colors.black54
                            )
                        ),

                        const SizedBox(width: 5.0,),

                        BoutiqueSort()

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
                                      ],
                                  )  ,


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
                                  "Mes Boutiques",
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
            flex: 5,
            child: _selectedIndex == 0?  ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemCount: boutiqueData.length,
                itemBuilder: (BuildContext context, int index){
                  var boutique = boutiqueData[index];
                  return Column(
                    children: [
                      boutiqueTile(boutique, context),
                      const SizedBox(height: 5),
                    ],
                  );
                }
            ) :  ListView.builder(

              padding: const EdgeInsets.only(bottom: 70, top: 0),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){
                  var boutique = boutiqueData[index];
                  return myBoutiqueTile(boutique, context);
                }
            )
            ,
          )

        ],
      ),

     floatingActionButton: _selectedIndex == 1 ?   FloatingActionButton(
       onPressed: (){
         Get.snackbar(
           "Add BOUTIQUE",
           "NOT IMPLEMENTED",
         );
       },
       backgroundColor: Theme.of(context).primaryColor,
       child: const Icon(Icons.add ,color: Colors.white,),
     ): Container()
    );
  }
}
