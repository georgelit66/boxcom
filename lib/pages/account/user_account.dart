import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Account", style: TextStyle(color: Colors.black54),),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black54,),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Column(
          children: [

            Center(
              child: Column(
                children: [
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


                  const SizedBox(height: 15,),

                  const Text(
                    "Paul Lee",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu',
                      fontSize: 19
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
