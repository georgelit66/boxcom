import 'package:boxcom/models/enterprise_model.dart';
import 'package:boxcom/pages/home_page/tabs/components/post_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../enterprise_tab/enterprise_detail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  showInSnackBar(
                    _isSubscribed ?  "${AppLocalizations.of(context)!.youSubscribedTo} ${ widget.enterprise.name}": "${AppLocalizations.of(context)!.youUnSubscribedFrom} ${ widget.enterprise.name}",
                    context
                  );


                },
                child: !_isSubscribed ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    alignment: Alignment.center,
                    padding:const EdgeInsets.all(1.0),
                    height: 30,

                    decoration: BoxDecoration(
                     gradient:  const LinearGradient(
                       colors: [
                         Colors.cyan,
                         Colors.cyanAccent
                       ]
                     ),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child:  Text(
                      AppLocalizations.of(context)!.subscribe,
                      style: const TextStyle(
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

                    height: 30,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:  Theme.of(context).primaryColor, width: 2)

                    ),
                    child: Text(
                      AppLocalizations.of(context)!.unsubscribe,
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
