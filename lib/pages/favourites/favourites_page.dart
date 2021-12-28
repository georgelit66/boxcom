import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.favourites),
        centerTitle: true,
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20,top: 30),
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

                          child:  Center(
                            child:  Text(
                              AppLocalizations.of(context)!.boutiqueTab,
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

                          child: Center(
                            child:  Text(
                              AppLocalizations.of(context)!.enterpriseTab,
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
    );
  }
}
