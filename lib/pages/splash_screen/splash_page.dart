import 'package:boxcom/pages/home_page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
     Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainHomePage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children: [
          Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child:  Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey
                  ),
                  child: Center(
                    child: Text(
                      "B",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 60,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )

              )
          ),

          const Positioned(
              bottom: 35,
              left: 15,
              right: 15,
              child: Center(

                  child:  Text("Boxcom", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 18),)
                )
              )

        ],
      )
    );
  }
}
