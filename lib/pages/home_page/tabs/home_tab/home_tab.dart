import 'package:boxcom/data/categories/automobiles.dart';
import 'package:boxcom/data/categories/clothes.dart';
import 'package:boxcom/data/categories/estates.dart';
import 'package:boxcom/data/categories/gadgets.dart';
import 'package:boxcom/data/categories/phones.dart';
import 'package:boxcom/data/enterprises.dart';
import 'package:boxcom/data/posts.dart';
import 'package:boxcom/models/category_model.dart';
import 'package:boxcom/models/enterprise_model.dart';
import 'package:boxcom/pages/home_page/tabs/home_tab/components/home_enterprise_card.dart';
import 'package:boxcom/pages/home_page/tabs/home_tab/components/post_view_home.dart';
import 'package:boxcom/pages/categories/category_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';



class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  final TrackingScrollController _trackingScrollController =
  TrackingScrollController();
  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  var isSubscribed = false;
  int _selectedIndex = 0;


  late List<Enterprise> enterprisePost;


 List<CategoryModel> returnCategories(BuildContext context){
   final List<CategoryModel> _icons = [
     CategoryModel(icon: Icons.shop, category: AppLocalizations.of(context)!.clothesCategory, items: [clothes]),
     CategoryModel(icon: Icons.drive_eta, category:  AppLocalizations.of(context)!.automobileCategory, items: [automobile]),
     CategoryModel(icon: Icons.headset_rounded, category:  AppLocalizations.of(context)!.gadgetsCategory, items: [gadgets]),
     CategoryModel(icon: Icons.phone_android_outlined, category:  AppLocalizations.of(context)!.phoneCategory, items: [phones]),
     CategoryModel(icon: Icons.house_outlined, category: AppLocalizations.of(context)!.estateCategory, items: [houses]),
   ];
   return _icons;
 }

  Widget _buildIcon(int index ,BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryPage(category: returnCategories(context)[_selectedIndex],)));
          });
        },
        child: Column(
          children: [
            Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
               color: Colors.grey[300],

                  borderRadius: BorderRadius.circular(30.0)),
              child: Icon(returnCategories(context)[index].icon,
                  size: 25.0,
                color: Colors.black54,
                  ),
            ),
            Text(
              returnCategories(context)[index].category,

            ),
          ],
        ));
  }




  @override
  Widget build(BuildContext context) {




    return CustomScrollView(
      controller: _trackingScrollController,
      slivers: [


        const SliverToBoxAdapter(
          child: SizedBox(
            height: 8.0,
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 170.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: enterprises.length,
              itemBuilder: (BuildContext context, int index) {
                return EnterpriseCard(
                  enterprise:enterprises[index],
                );
              },
            )
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 5.0,
          ),
        ),

        SliverToBoxAdapter(
          child:Container(
            width: MediaQuery.of(context).size.width,
            height: 55.0,
            margin: const EdgeInsets.symmetric(vertical: 0),
            padding:  const EdgeInsets.symmetric(vertical: 0),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:  ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: returnCategories(context).length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      const SizedBox(width: 20),
                      _buildIcon(index, context),
                      const SizedBox(width: 20),
                    ],
                  );
                },
              ),
            )
          ),
        ),


          SliverPadding(
            padding: const EdgeInsets.only(top: 0),
            sliver: SliverList(
              delegate:  SliverChildBuilderDelegate(
                    (context, index) {
                  return PostHome(post: postList[index]);
                },
                childCount: postList.length,
              ),

            ),
          ),





      ],
    );
  }
}
