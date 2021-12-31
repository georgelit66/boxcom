import 'package:boxcom/pages/home_page/tabs/boutique_tab/components/boutique_form.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/components/boutique_search.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/controller/boutique_provider.dart';
import 'package:boxcom/pages/home_page/tabs/components/list_enterprises_boutiques_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/sort_boutique.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoutiqueTab extends StatefulWidget {
  const BoutiqueTab({Key? key}) : super(key: key);

  @override
  _BoutiqueTabState createState() => _BoutiqueTabState();
}

class _BoutiqueTabState extends State<BoutiqueTab> {



var _selectedIndex = 0;

@override
  Widget build(BuildContext context) {


    final boutiqueProvider = context.watch<BoutiqueProvider>().getBoutiques();

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
                          fontSize: 22
                      ),
                    ),

                    Row(
                      children: [


                        IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const BoutiqueSearch()));
                            },
                            icon: const Icon(
                                Icons.search,
                            )
                        ),

                        const SizedBox(width: 5.0,),

                        const BoutiqueSort()

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
                                        Colors.cyanAccent,
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

                              child:  Center(
                                child:  Text(
                                  AppLocalizations.of(context)!.subscriptions,
                                  style: const TextStyle(
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

                              child:  Center(
                                child:  Text(
                                 AppLocalizations.of(context)!.myBoutiques,
                                  style: const TextStyle(
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
                itemCount:boutiqueProvider.length,
                itemBuilder: (BuildContext context, int index){
                  var boutique =boutiqueProvider[index];
                  return Column(
                    children: [
                      BoutiqueTile(boutique: boutique),
                      const SizedBox(height: 5),
                    ],
                  );
                }
            ) :  ListView.builder(

              padding: const EdgeInsets.only(bottom: 70, top: 0),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){
                  var boutique = boutiqueProvider[index];
                  return myBoutiqueTile(boutique, context);
                }
            )
            ,
          )

        ],
      ),

     floatingActionButton: _selectedIndex == 1 ?   FloatingActionButton(
       onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=> const BoutiqueForm()));
       },
       backgroundColor: Theme.of(context).primaryColor,
       child: const Icon(Icons.add ,color: Colors.white,),
     ): Container()
    );
  }
}
