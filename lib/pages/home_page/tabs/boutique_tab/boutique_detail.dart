import 'package:boxcom/data/boutiques.dart';
import 'package:boxcom/data/users.dart';
import 'package:boxcom/models/boutique_model.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/components/boutique_partners.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/components/boutique_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'components/boutique_followers.dart';

class BoutiqueDetail extends StatefulWidget {
  const BoutiqueDetail({Key? key, required this.boutique}) : super(key: key);
  final Boutique boutique;

  @override
  _BoutiqueDetailState createState() => _BoutiqueDetailState();
}

class _BoutiqueDetailState extends State<BoutiqueDetail> {



  var _isSubscribed = false;

  final TrackingScrollController _trackingScrollController =
  TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

              body: CustomScrollView(
                controller:_trackingScrollController,
                slivers: [

                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Theme.of(context).bottomAppBarColor,
                    centerTitle: true,
                    title: Text(
                      widget.boutique.name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    leading: IconButton(
                      icon: const Icon(
                          Icons.arrow_back,
                      ),
                      onPressed: () {
                        Navigator.pop(context);

                      },
                    ),

                    actions: [
                      IconButton(
                        icon: const Icon(
                            Icons.more_vert,
                        ),
                        onPressed: () {
                        },
                      ),
                    ],
                  ),

                  SliverToBoxAdapter(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child:  Row(

                      children: [

                        CircleAvatar(
                          backgroundImage:
                          const AssetImage("assets/images/placeholder1.png"),
                          foregroundImage:AssetImage(widget.boutique.imgUrl),
                          radius: 50.0,
                        ),

                        const SizedBox(width: 15.0,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.boutique.name,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            const SizedBox(height: 5.0,),
                            Text(
                              widget.boutique.boutique_sector,
                              style: const TextStyle(
                                  fontSize: 14
                              ),
                            ),
                            const SizedBox(height: 5.0,),
                            const Text(
                              "https://facebook.com",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14
                              ),
                            ),


                          ],
                        ),

                      ],
                    ),
                  ),

        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0,),
                    Row(
                      children:  [
                        const Icon(
                          Icons.location_on,
                          size: 20,
                        ),
                        const SizedBox(width: 5.0,),
                        Text(
                          widget.boutique.address,
                          style: const TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10.0,),

                    Row(
                      children:  [
                        const Icon(
                          Icons.phone,
                          size: 20,
                        ),
                        const SizedBox(width: 5.0,),
                        Text(
                          widget.boutique.telephone,
                          style: const TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10.0,),
                    Row(
                      children:  const [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 20,
                        ),
                        SizedBox(width: 8.0,),
                        Text(
                          "${"8:00"} - ${"18:00"}",
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10.0,),


                  ],
                ),

                Wrap(
                  children: [

                    InkWell(
                      onTap: () {
                        setState(() {
                          _isSubscribed = !_isSubscribed;
                        });


                      },
                      child: _isSubscribed
                          ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(colors: [
                             Colors.cyanAccent,
                              Theme.of(context).primaryColor
                            ]),
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              AppLocalizations.of(context)!.subscribe,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ))
                          : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: const LinearGradient(colors: [
                              Colors.black26,
                              Colors.grey
                            ]),
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              AppLocalizations.of(context)!.unsubscribe,
                              style: const TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                    const SizedBox(width: 15.0,),


                  ],
                )
              ],
            )
        ),



        const SizedBox(height: 5.0,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child:  Text(
            widget.boutique.description,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        const SizedBox(height: 15.0,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const BoutiqueFollowers()));

                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children:  [
                      Text(users.length.toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                        ),),
                      const SizedBox(height: 3.0,),
                      Text(
                        AppLocalizations.of(context)!.members,
                        style: const TextStyle(
                            fontSize: 16
                        ),
                      )
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap:(){

                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const BoutiquePartners()));

                },
                child:
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children:  [
                      Text(widget.boutique.following.toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                        )
                      ),
                      const SizedBox(height: 3.0,),
                      Text(
                        AppLocalizations.of(context)!.partners,
                        style: const TextStyle(
                            fontSize: 16
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Column(
                children:  [
                  Text( boutiques.length.toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                    )
                  ),
                  const SizedBox(height: 3.0,),
                  Text(
                    AppLocalizations.of(context)!.products,
                    style: const TextStyle(
                        fontSize: 16
                    ),
                  )
                ],
              ),
            ],
          ),
        )]
                    ),
                  ),


                  SliverToBoxAdapter(
                    child:    MediaQuery.of(context).size.width >= 600?
                      GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.all(5),
                        itemCount:widget.boutique.products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          var product = widget.boutique.products[index];
                          return productCard(product);
                        },
                      ):  GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.all(5),
                        itemCount:widget.boutique.products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          var product = widget.boutique.products[index];
                          return productCard(product);
                        },
                      ),
                    ),

                ],
              )



    );
  }
}
