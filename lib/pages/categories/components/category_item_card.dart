import 'package:boxcom/widgets/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryItemCard extends StatefulWidget {
  const CategoryItemCard({Key? key,required this.item}) : super(key: key);
  
  final dynamic item;

  @override
  _CategoryItemCardState createState() => _CategoryItemCardState();
}

class _CategoryItemCardState extends State<CategoryItemCard> {
  @override
  Widget build(BuildContext context) {
    
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetail(item: widget.item,)));
    },
    child: Card(
        elevation: 1,
        child: SizedBox(
          height: 95,
          child: Stack(
            children: [

              Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Ink.image(
                      height:height * .95 ,
                      image: AssetImage(
                          widget.item.image
                      ),
                      fit: BoxFit.cover,
                    ),
                  )
              ),

              Positioned(
                  right: 20,
                  top: 10,
                  child: SizedBox(
                    width: width * .55,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.name,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5,),

                        Text(
                          widget.item.description,
                          style: const TextStyle(
                            color: Colors.black38,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 5,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.black38,
                            ),
                            const SizedBox(width: 5,),
                            Text(
                              widget.item.address,
                              style: const TextStyle(
                                color: Colors.black38,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  )
              ),

              Positioned(

                right:10,
                bottom: 5,
                child:  Text(
                  "${widget.item.price} CFA",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),


              ),
            ],
          ),

        ),

      ),
  );
  }
}
