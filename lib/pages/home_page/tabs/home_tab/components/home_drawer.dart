
import 'package:boxcom/pages/account/user_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget returnDrawer(BuildContext context) {
  return Drawer(
      elevation: 12,
      child: ListView(
        padding: EdgeInsets.zero,
        children:  <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(

              color: Colors.white,
            ),
            child: Center(
              child:Stack(
                children:  [

                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4.0,
                            color: Theme.of(context).backgroundColor
                        ),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0,10)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/stmarksbasilica.jpg'
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),


                  Positioned(
                    bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration:BoxDecoration(
                            border: Border.all(
                                width: 4.0,
                                color: Theme.of(context).backgroundColor
                            ),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0,10)
                              )
                            ],
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle
                        ),
                        child: const Icon(
                            Icons.enhance_photo_translate_outlined,
                          color: Colors.white,
                        ),
                      )
                  )
                ],
              )
            ),
          ),

          const Divider(height: 2,),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserAccount()));
            },
            child: ListTile(
              leading: Icon(
                  Icons.perm_identity_sharp,
                  color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                  "My Account",
                  style: TextStyle(
                ),
              ),
              trailing: const Icon(CupertinoIcons.forward) ,
            ),
          ),



          const SizedBox(height: 5.0,),

          ListTile(
            leading: Icon(
                Icons.settings,
                color: Theme.of(context).primaryColor,
            ),
            title: const Text(
                "Settings",
              style: TextStyle(
              ),
            ),
            trailing: const Icon(CupertinoIcons.forward) ,
          ),

          const SizedBox(height: 5.0,),

         ListTile(
              leading: Icon(
                Icons.data_usage_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text(
                "Mes Enregistrements",
                style: TextStyle(
                ),
              ),
              trailing: const Icon(CupertinoIcons.forward)
          ),


          const SizedBox(height: 5.0,),

         ListTile(
            leading: Icon(
                Icons.help_center_outlined,
                color: Theme.of(context).primaryColor,
            ),
            title: const Text(
                "Help Center",
              style: TextStyle(
              ),
            ),
            trailing: const Icon(CupertinoIcons.forward) ,
          ),


          const SizedBox(height: 5.0,),

          ListTile(
            leading: Icon(
                Icons.language_outlined,
                color: Theme.of(context).primaryColor,
            ),
            title: const Text(
                "Language",
              style: TextStyle(
              ),
            ),
            trailing: const Icon(CupertinoIcons.forward),

          ),

          ListTile(
            leading: Icon(
                CupertinoIcons.moon_fill,
                color: Theme.of(context).primaryColor,
            ),
            title: const Text(
                "Themes",
              style: TextStyle(

              ),
            ),
            trailing: const Icon(CupertinoIcons.forward),

          ),
          const SizedBox(height: 5.0,),

         ListTile(
            leading: Icon(
                CupertinoIcons.nosign,
                color: Theme.of(context).primaryColor,
            ),
            title: const Text(
                "Logout",
              style: TextStyle(
              ),
            ),
            trailing: const Icon(CupertinoIcons.forward),


          ),




        ],
      )

  );
}
