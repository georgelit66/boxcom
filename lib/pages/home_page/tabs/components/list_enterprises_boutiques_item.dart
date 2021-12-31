import 'package:boxcom/models/boutique_model.dart';
import 'package:boxcom/models/enterprise_model.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/boutique_detail.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/my_boutique_detail.dart';
import 'package:boxcom/pages/home_page/tabs/components/post_menu.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/my_enterprise_detail.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/enterprise_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                    '${4}  ${(AppLocalizations.of(context)!.subscribers)}',
                    style: const TextStyle(
                        letterSpacing: 0.5,
                        fontSize: 13,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _isFollowing = !_isFollowing;
                      });
                      showInSnackBar(
                          _isFollowing ?  "${(AppLocalizations.of(context)!.youSubscribedTo)} ${ widget.enterprise.name}": "${(AppLocalizations.of(context)!.youUnSubscribedFrom)}${ widget.enterprise.name}",
                          context
                      );

                    },
                    child: !_isFollowing ? Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          gradient:  LinearGradient(
                              colors: [
                               Colors.cyanAccent,
                                Theme.of(context).primaryColor
                              ]
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child:  Text(
                            (AppLocalizations.of(context)!.subscribe),
                            style: const TextStyle(
                                color: Colors.white,
                               fontWeight: FontWeight.w600
                            ),
                          ),
                        )
                    ): Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black26
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child:  Text(
                            (AppLocalizations.of(context)!.unsubscribe),
                            style: const TextStyle(
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
            "${5 * 0.001.toDouble()}k ${(AppLocalizations.of(context)!.subscribers)}"
                :3.toString() + " " + (AppLocalizations.of(context)!.subscribers),
            style: const TextStyle(
                fontSize: 14
            ),
          )
      ),
    ),
  );
}


class BoutiqueTile extends StatefulWidget {
  const BoutiqueTile({Key? key, required this.boutique}) : super(key: key);
  final Boutique boutique;

  @override
  _BoutiqueTileState createState() => _BoutiqueTileState();
}

class _BoutiqueTileState extends State<BoutiqueTile> {

  var _isFollowing = true;
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> BoutiqueDetail(boutique: widget.boutique,)));
            },
            child:  ListTile(
                leading: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BoutiqueDetail(boutique: widget.boutique,)));
                  },
                  child:  CircleAvatar(
                    backgroundImage: const AssetImage(
                        "assets/images/placeholder1.png"
                    ),
                    foregroundImage:AssetImage(
                        widget.boutique.imgUrl
                    ),
                    radius: 30,
                  ),
                ),
                contentPadding: const EdgeInsets.all(0),
                title: Text(widget.boutique.name),
                subtitle: Text(widget.boutique.boutique_sector),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(right: 15, bottom: 2),
                      child:    Text(
                        '${widget.boutique.followers} ${(AppLocalizations.of(context)!.subscribers)}',
                        style: const TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 13,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            _isFollowing = !_isFollowing;
                          });
                          showInSnackBar(
                              _isFollowing ?  "${(AppLocalizations.of(context)!.youSubscribedTo)} ${ widget.boutique.name}": "${(AppLocalizations.of(context)!.youUnSubscribedFrom)} ${ widget.boutique.name}",
                              context
                          );

                        },
                        child: !_isFollowing ? Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient:  LinearGradient(
                                  colors: [
                                    Colors.cyanAccent,
                                    Theme.of(context).primaryColor
                                  ]
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child:  Text(
                                (AppLocalizations.of(context)!.subscribe),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                        ): Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black26
                            ),
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child:  Text(
                                (AppLocalizations.of(context)!.unsubscribe),
                                style: const TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
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
            "${boutique.followers * 0.001.toDouble()}k  ${(AppLocalizations.of(context)!.subscribers)}"
                :boutique.followers.toString() + " " + ( AppLocalizations.of(context)!.subscribers),
            style: const TextStyle(
                fontSize: 14
            ),
          )

      ),
    )
  );
}
