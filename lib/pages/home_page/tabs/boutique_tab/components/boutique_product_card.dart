import 'dart:ui';
import 'package:boxcom/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget productCard(Product product){
  return InkWell(
    child: Card(
      elevation: 5.0,
      child: Stack(
        children: [
          Column(
            children: [
      SizedBox(

      child: Builder(builder: (context)=> Ink.image(
        height: MediaQuery.of(context).size.width <= 800 ? 110: 250 ,
        image: AssetImage(
          product.imgUrl[0],
        ),
        fit: BoxFit.cover,
      ),)

             ),
              const Divider(thickness: 2.0,),

              const SizedBox(height: 5.0,),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child:    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        const SizedBox(height: 6.0,),

                        Text(
                           "${product.price} CFA",
                          style: const TextStyle(
                              color: Colors.cyan,
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),

                      ],

                    ),


                    IconButton(
                        onPressed: (){},
                        icon:  const Icon(
                         CupertinoIcons.heart,
                       color: Colors.cyan
                       )
                    )
                  ],
                ),
              )




        ],
      ),

])),
  );

}







Widget myProductCard(Product product) {
  return Card(
    elevation: 5.0,
    child: Stack(
      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child:Builder(builder: (context)=> Image(
               height: MediaQuery.of(context).size.width <= 800 ? 110: 250 ,
               image: AssetImage(
                product.imgUrl[0],
                ),
              fit: BoxFit.cover,
              ),)
            ),


            const Divider(thickness: 2.0,),

            const SizedBox(height: 5.0,),


            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child:    Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(height: 6.0,),

                      Text(
                        "XAF " + product.price.toString(),
                        style: const TextStyle(
                            color: Colors.cyan,
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),

                    ],

                  ),


                  IconButton(
                      onPressed: (){},
                      icon:  const Icon(
                        CupertinoIcons.delete,
                        color: Colors.black54,
                        size: 18,
                      )
                  )
                ],
              ),
            )



          ],
        ),




      ],
    ),
  );
}

