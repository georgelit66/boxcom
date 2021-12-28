import 'package:boxcom/pages/home_page/tabs/enterprise_tab/components/enterprise_search.dart';
import 'package:boxcom/pages/home_page/tabs/components/list_enterprises_boutiques_item.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/controller/enterprise_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'components/enterprise_form.dart';
import 'components/sort_enterprise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EnterpriseTab extends StatefulWidget {
  const EnterpriseTab({Key? key}) : super(key: key);



  @override
  _EnterpriseTabState createState() => _EnterpriseTabState();
}

class _EnterpriseTabState extends State<EnterpriseTab> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {



    final enterpriseProvider = context.watch<EnterpriseProvider>().getEnterprises();


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

                      ),
                    ),

                    Row(
                      children: [


                        const SizedBox(width: 5.0,),

                        IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const EnterpriseSearch()));
                            },
                            icon:const Icon(
                              Icons.search,
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

                              child: Center(
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
                                  AppLocalizations.of(context)!.myEnterprises,
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
            flex: 4,
            child: _selectedIndex == 0?
            ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemCount:enterpriseProvider.length,
                itemBuilder: (BuildContext context, int index){
                  var enterprise = enterpriseProvider[index];
                  return EnterpriseTile(enterprise: enterprise);
                }
            )
           : ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemCount:enterpriseProvider.length,
                itemBuilder: (BuildContext context, int index){
                  var enterprise =enterpriseProvider[index];
                  return myEnterpriseTile(enterprise, context);
                }
            )
          )

        ],
      ),

        floatingActionButton: _selectedIndex == 1 ?   FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> const EnterpriseForm()));

          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        ): Container()
    );
  }
}
