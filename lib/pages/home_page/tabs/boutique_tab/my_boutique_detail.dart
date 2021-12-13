import 'package:boxcom/models/boutique_model.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/boutique_edit.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/components/boutique_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBoutiqueDetail extends StatefulWidget {
  const MyBoutiqueDetail({Key? key, required this.boutique}) : super(key: key);
  final Boutique boutique;

  @override
  _MyBoutiqueDetailState createState() => _MyBoutiqueDetailState();
}


class _MyBoutiqueDetailState extends State<MyBoutiqueDetail> {


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


        body:



              CustomScrollView(
                controller: _trackingScrollController,

                slivers: [

                  SliverAppBar(
                    pinned: true,
                    centerTitle: true,
                    title: Text(
                      widget.boutique.name,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    backgroundColor: Colors.white,
                    leading: IconButton(
                      icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black
                      ),
                      onPressed: () {
                        Navigator.pop(context);

                      },
                    ),

                    actions: [
                      IconButton(
                        icon: const Icon(
                            Icons.more_vert,
                            color: Colors.black
                        ),
                        onPressed: () {
                        },
                      ),
                    ],

                  ),

                  SliverToBoxAdapter(
                    child:  Column(

                        children: [

                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child:  Row(

                      children: [

                        CircleAvatar(
                          backgroundImage:
                          AssetImage(widget.boutique.imgUrl),
                          radius: 50.0,
                        ),

                        const SizedBox(width: 15.0,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.boutique.name,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            const SizedBox(height: 5.0,),
                            Text(
                              widget.boutique.boutique_sector,
                              style: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14
                              ),
                            ),



                          ],
                        )
                      ],
                    ),
                  ),

        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
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
                          color: Colors.black45,
                          size: 20,
                        ),
                        const SizedBox(width: 5.0,),
                        Text(
                          widget.boutique.address,
                          style: const TextStyle(
                              color: Colors.black54,
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
                          color: Colors.black45,
                          size: 20,
                        ),
                        const SizedBox(width: 5.0,),
                        Text(
                          widget.boutique.telephone,
                          style: const TextStyle(
                              color: Colors.black54,
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
                          color: Colors.black45,
                          size: 20,
                        ),
                        SizedBox(width: 8.0,),
                        Text(
                          "${"8:00"} - ${"18:00"}",
                          style: TextStyle(
                              color: Colors.black54,
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
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> BoutiqueEdit(boutique: widget.boutique)));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            gradient:  LinearGradient(
                                colors: [
                                  Theme.of(context).indicatorColor,
                                  Theme.of(context).primaryColor
                                ]
                            ),
                          ),
                          child:  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.edit,
                                    size: 17,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5.0,),
                                  Text(
                                    "Edit",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              )
                          )
                      ),
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
                color: Colors.black54,
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

                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children:  [
                      Text(widget.boutique.followers.toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                        ),),
                      const SizedBox(height: 3.0,),
                      const Text(
                        "followers",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16
                        ),
                      )
                    ],
                  ),
                ),
              ),

              InkWell(
                  onTap:(){


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
                              color: Colors.black87
                          ),),
                        const SizedBox(height: 3.0,),
                        const Text(
                          "partners",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16
                          ),
                        )
                      ],
                    ),
                  )),

              Column(
                children:  [
                  Text(widget.boutique.products.length.toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87
                    ),),
                  const SizedBox(height: 3.0,),
                  const Text(
                    "products",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16
                    ),
                  )
                ],
              ),
            ],
          ),
        ),


        const SizedBox(height: 15.0,),

        ]),
                  ),





                  SliverToBoxAdapter(
                    child:  GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(5),
                      itemCount:widget.boutique.products.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        var product = widget.boutique.products[index];
                        return myProductCard(product);
                      },
                    ),
                  )


                ],
              )
    );
  }
}