import 'package:boxcom/models/boutique_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget notify(Boutique boutique, BuildContext context){
  return    Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15, top: 20),
    child: Container(
      height: 90,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0),
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(5.0),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
              offset: Offset(
                0, // Move to right 10  horizontally
                4, // Move to bottom 10 Vertically
              ),
            )
          ]
      ),


      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListTile(
          leading:  CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                  boutique.imgUrl
              )),
          title: Text(
            boutique.name,
            style: GoogleFonts.lato(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            boutique.boutique_sector,
            style: GoogleFonts.lato(
                color: Colors.grey[700],
                letterSpacing: 1,
                fontSize: 13,
                fontWeight: FontWeight.normal),
          ),
          trailing: Column(
            children: [
              Text(
                '${boutique.followers} followers',
                style: GoogleFonts.lato(
                    color: Colors.grey[500],
                    letterSpacing: 0.6,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              const Icon(
                Icons.add,
                color: Colors.orange,
              ),
            ],
          ),
          isThreeLine: false,
        ),
      ),
    ),
  );
}