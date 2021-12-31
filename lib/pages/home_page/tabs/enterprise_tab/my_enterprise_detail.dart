import 'package:boxcom/data/enterprises.dart';
import 'package:boxcom/data/posts.dart';
import 'package:boxcom/data/users.dart';
import 'package:boxcom/models/enterprise_model.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/components/my_boutique_partners.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/enterprise_edit.dart';
import 'package:boxcom/pages/home_page/tabs/home_tab/components/post_view_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'components/my_enterprise_partners.dart';
import 'components/new_enterprise_post.dart';

class MyEnterpriseDetail extends StatefulWidget {
  const MyEnterpriseDetail({Key? key, required this.enterprise}) : super(key: key);
  final Enterprise enterprise;

  @override
  _MyEnterpriseDetailState createState() => _MyEnterpriseDetailState();
}

class _MyEnterpriseDetailState extends State<MyEnterpriseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Theme.of(context).bottomAppBarColor,
          elevation: 10,
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


          title: Text(
            widget.enterprise.name,
            style: const TextStyle(
            ),
          ),
          centerTitle: true,
        ),

        body: ListView(

            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 05.0),
                child:  Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                      AssetImage(widget.enterprise.image),
                      radius: 55.0,
                    ),

                    const SizedBox(width: 20.0,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          widget.enterprise.name,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(height: 5.0,),
                        Text(
                          widget.enterprise.enterpriseSector,
                          style: const TextStyle(
                              fontSize: 14
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),


              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),

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
                                size: 20,
                              ),
                              const SizedBox(width: 5.0,),
                              Text(
                                widget.enterprise.ville,
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
                                widget.enterprise.telephone,
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
                                Icons.calendar_today_outlined,
                                size: 20,
                              ),
                              const SizedBox(width: 8.0,),
                              Text(
                                "${widget.enterprise.openHour} - ${widget.enterprise.closingHour}",
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
                                Icons.language_outlined,
                                size: 20,
                              ),
                              const SizedBox(width: 8.0,),
                              Text(
                                widget.enterprise.website,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Wrap(
                            children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> EnterpriseEdit(enterprise: widget.enterprise)));
                              },
                              child:   Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                    gradient:LinearGradient(
                                        colors: [
                                          Colors.cyanAccent,
                                          Theme.of(context).primaryColor
                                        ]
                                    ),
                                  ),
                                  child:  Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                      child: Row(
                                        children: [

                                          const Icon(
                                            Icons.edit,
                                            size: 17,
                                            color: Colors.white,
                                          ),

                                          const SizedBox(width: 5.0,),
                                          Text(
                                            AppLocalizations.of(context)!.edit,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      )
                                  )
                              ),
                            ),

                              const SizedBox(width: 5.0,),

                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewEnterprisePost()));
                                },
                                child:   Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient:LinearGradient(
                                          colors: [
                                           Colors.cyanAccent,
                                            Theme.of(context).primaryColor
                                          ]
                                      ),
                                    ),
                                    child:  Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                        child: Row(
                                          children:[

                                            const Icon(
                                              Icons.add,
                                              size: 17,
                                              color: Colors.white,
                                            ),

                                            const SizedBox(width: 5.0,),
                                            Text(
                                           AppLocalizations.of(context)!.post,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,

                                              ),
                                            ),
                                          ],
                                        )
                                    )
                                ),
                              ),


                            ],
                          ),


                        ],
                      )
                    ],
                  )
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child:  Text(
                  widget.enterprise.description,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
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
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const MyBoutiquePartners()));

                      },
                      child:  Container(
                        padding:  const EdgeInsets.all(4),
                        child: Column(
                          children:   [
                             Text(
                              users.length.toString(),
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
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const MyEnterprisePartners()));
                       },
                      child:
                      Container(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                             Text(
                                enterprises.length.toString(),
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
                      children:  const [
                         Text("43",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                          ),),
                        SizedBox(height: 3.0,),
                        Text(
                          "posts",
                          style: TextStyle(
                              fontSize: 16
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15.0,),
             PostHome(post: postList[2],)

            ]
        )

    );
  }
}
