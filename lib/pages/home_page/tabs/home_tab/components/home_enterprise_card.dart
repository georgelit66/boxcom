import 'package:boxcom/models/enterprise_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';
import '../../enterprise_tab/enterprise_detail.dart';

class EnterpriseCard extends StatefulWidget {
  const EnterpriseCard({Key? key, required this.enterprise}) : super(key: key);
  final Enterprise enterprise;

  @override
  _EnterpriseCardState createState() => _EnterpriseCardState();
}

class _EnterpriseCardState extends State<EnterpriseCard> {

   var _isSubscribed = false;
  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> EnterpriseDetail(enterprise: widget.enterprise)));
        },
      child: Container(
          margin:const EdgeInsets.all(03.0),
          width: 115.0,

          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 0.2),
                    blurRadius: 6.0
                )
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Padding(
                  padding:const EdgeInsets.symmetric(vertical: 4.0),

                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> EnterpriseDetail(enterprise: widget.enterprise)));

                    },
                    child:SizedBox(
                      height: 85,
                      width: 85,
                      child:  ClipRRect(
                        borderRadius: BorderRadius.circular(85),
                        child: FadeInImage(
                          placeholder: const AssetImage(
                              "assets/images/placeholder1.png"
                          ),
                          image:AssetImage(widget.enterprise.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  )
              ),


              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  widget.enterprise.name,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),


              const SizedBox(height: 5.0,),

              GestureDetector(
                onTap: (){
                  setState(() {
                    _isSubscribed = !_isSubscribed;
                  });

                  Get.snackbar(
                      "Follow Action",
                     _isSubscribed ?  "you followed ${ widget.enterprise.name}": "you are unfollowing ${ widget.enterprise.name}",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black54,
                      colorText: Colors.white
                  );
                },
                child: !_isSubscribed ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    alignment: Alignment.center,
                    padding:const EdgeInsets.all(1.0),
                    height: 30,

                    decoration: BoxDecoration(
                     gradient:  LinearGradient(
                       colors: [
                         Theme.of(context).indicatorColor,
                         Theme.of(context).primaryColor
                       ]
                     ),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: const Text(
                      "S'abonner",
                      style: TextStyle(
                          color: Colors.white ,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0
                      ),
                    ),
                  ),
                ): Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    alignment: Alignment.center,
                    padding:const EdgeInsets.all(1.0),
                    height: 30,

                    decoration: BoxDecoration(
                      color:  Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:  Theme.of(context).primaryColor)

                    ),
                    child: Text(
                      "Desabonner",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0
                      ),
                    ),
                  ),
                ) ,
              ) ,

            ],
          )

      ),
    );
  }
}
