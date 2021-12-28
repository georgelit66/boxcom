import 'package:boxcom/data/enterprises.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:boxcom/pages/home_page/tabs/components/list_enterprises_boutiques_item.dart';
import 'package:boxcom/pages/home_page/tabs/home_tab/components/home_drawer.dart';
import 'package:boxcom/pages/home_page/components/home_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tabs/boutique_tab/boutique_tab.dart';
import 'tabs/enterprise_tab/enteprise_tab.dart';
import 'tabs/home_tab/home_tab.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);



  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {


  @override
  Widget build(BuildContext context) => DefaultTabController(

      length: 3,
      child:Scaffold(
        drawer: const AppDrawer(),
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxScrolled)=>[
               SliverAppBar(
                 backgroundColor: Theme.of(context).backgroundColor,

                pinned: true,
                floating: true,

                leading:  Builder(builder: (context)=> (
                    IconButton(
                        onPressed:(){
                          Scaffold.of(context).openDrawer();
                        },
                        icon:const Icon(
                          Icons.menu_outlined,
                          size: 30.0,
                        )
                    )
                )),

                title: Text(
                  AppLocalizations.of(context)!.appName,
                style: TextStyle(color:Theme.of(context).primaryColor ),),


                actions: [


                  IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeSearch()));
                      },
                      icon:const Icon(
                        Icons.search,
                        size: 30,
                      )
                  ),




                ],
                bottom:  TabBar(
                  physics: const ScrollPhysics(),
                  isScrollable: false,
                  labelColor: Theme.of(context).primaryColor,
                  indicatorColor:  Theme.of(context).indicatorColor,
                  indicatorWeight: 5,
                  tabs:  [
                    Tab(icon: const Icon(Icons.home), text:  AppLocalizations.of(context)!.homeTab,),
                    Tab(icon: const Icon(Icons.apartment_sharp), text: AppLocalizations.of(context)!.enterpriseTab),
                    Tab(icon: const Icon(Icons.shopping_cart), text:AppLocalizations.of(context)!.boutiqueTab,),


                  ],
                ),
              )
            ],

            body: const TabBarView(
              children: [
                HomeTab(),
                EnterpriseTab(),
                BoutiqueTab(),
              ],
            )
        ),
      )
  );
}

Widget buildData(){
  return ListView.builder(
      itemCount: enterprises.length,
      itemBuilder: (BuildContext context, int index){
        return EnterpriseTile(enterprise: enterprises[index],);
      }
  );
}