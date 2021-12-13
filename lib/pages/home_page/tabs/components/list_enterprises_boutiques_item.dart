import 'package:boxcom/models/boutique_model.dart';
import 'package:boxcom/models/enterprise_model.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/boutique_detail.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/my_boutique_detail.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/my_enterprise_detail.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/enterprise_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterpriseTile extends StatefulWidget {
  const EnterpriseTile({Key? key, required this.enterprise}) : super(key: key);
  final Enterprise enterprise;


  @override
  _EnterpriseTileState createState() => _EnterpriseTileState();
}

class _EnterpriseTileState extends State<EnterpriseTile> {

  var _isFollowing = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> EnterpriseDetail(enterprise:  widget.enterprise,)));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListTile(
            leading: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EnterpriseDetail(enterprise:  widget.enterprise,)));
              },
              child:  CircleAvatar(
                foregroundImage: AssetImage(
                widget.enterprise.image,
                ),
                backgroundImage: const AssetImage(
                    "assets/images/placeholder1.png"
                ),
                radius: 25,
              ),
            ),
            contentPadding: const EdgeInsets.all(0),
            title: Text( widget.enterprise.name),
            subtitle: Text( widget.enterprise.enterpriseSector),
            trailing: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(right: 15, bottom: 2),
                  child:    Text(
                    '${4} followers',
                    style: GoogleFonts.lato(
                        color: Colors.grey[500],
                        letterSpacing: 0.5,
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _isFollowing = !_isFollowing;
                      });
                      Get.snackbar(
                          "follow", "you unfollowed ${ widget.enterprise.name}",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.black54,
                          colorText: Colors.white
                      );
                    },
                    child: !_isFollowing ? Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          gradient:  LinearGradient(
                              colors: [
                                Theme.of(context).indicatorColor,
                                Theme.of(context).primaryColor
                              ]
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child:  Text(
                            "Follow",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        )
                    ): Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black26
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child:  Text(
                            "Unfollow",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
    )
      ),
    );
  }
}



Widget myEnterpriseTile(Enterprise enterprise, BuildContext context){
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MyEnterpriseDetail(enterprise: enterprise,)));
    },
    child:  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
          leading: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyEnterpriseDetail(enterprise: enterprise,)));
            },
            child:  CircleAvatar(
              foregroundImage: AssetImage(
                enterprise.image,
              ),
              backgroundImage: const AssetImage(
                  "assets/images/placeholder1.png"
              ),
              radius: 30,
            ),
          ),
          contentPadding: const EdgeInsets.all(0),
          title: Text(enterprise.name),
          subtitle: Text(enterprise.enterpriseSector),
          trailing: Text(
            32 > 1000 ?
            "${5 * 0.001.toDouble()}k followers"
                :3.toString() + " followers",
            style: const TextStyle(
                fontSize: 14
            ),
          )
      ),
    ),
  );
}



Widget boutiqueTile(Boutique boutique, BuildContext context){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> BoutiqueDetail(boutique: boutique,)));
      },
      child:  ListTile(
          leading: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> BoutiqueDetail(boutique: boutique,)));
            },
            child:  CircleAvatar(
              backgroundImage: const AssetImage(
                 "assets/images/placeholder1.png"
              ),
              foregroundImage:AssetImage(
                  boutique.imgUrl
              ),
              radius: 30,
            ),
          ),
          contentPadding: const EdgeInsets.all(0),
          title: Text(boutique.name),
          subtitle: Text(boutique.boutique_sector),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(right: 15, bottom: 2),
                child:    Text(
                  '${boutique.followers} followers',
                  style: GoogleFonts.lato(
                      color: Colors.grey[500],
                      letterSpacing: 0.5,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                ),
              ),


              GestureDetector(
                  onTap: (){
                    Get.snackbar(
                        "follow", "you followed ${boutique.name}",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.black54,
                        colorText: Colors.white
                    );
                  },
                  child: Container(
                 
                    decoration: BoxDecoration(
                        gradient:  LinearGradient(
                            colors: [
                              Theme.of(context).indicatorColor,
                              Theme.of(context).primaryColor
                            ]
                        ),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child:  Text(
                        "Follow",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  )
              ),
            ],
          )
      )
    )
  );
}



Widget myBoutiqueTile(Boutique boutique, BuildContext context){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MyBoutiqueDetail(boutique: boutique,)));
      },
      child: ListTile(
          leading: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyBoutiqueDetail(boutique: boutique,)));
            },
            child:  CircleAvatar(
              foregroundImage: AssetImage(
               boutique.imgUrl,
              ),
              backgroundImage: const AssetImage(
                  "assets/images/placeholder1.png"
              ),
              radius: 30,
            ),
          ),
          contentPadding: const EdgeInsets.all(0),
          title: Text(boutique.name),
          subtitle: Text(boutique.boutique_sector),
          trailing:
          Text(
            boutique.followers > 1000 ?
            "${boutique.followers * 0.001.toDouble()}k followers"
                :boutique.followers.toString() + " followers",
            style: const TextStyle(
                fontSize: 14
            ),
          )

      ),
    )
  );
}
