import 'dart:async';
import 'package:boxcom/pages/authentication/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'intro_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final splashDelay = 2;
  @override
  void initState() {
    _loadWidget();
    super.initState();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, checkFirstSeen);
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _introSeen = (prefs.getBool('intro_seen') ?? false);

    Navigator.pop(context);
    if (_introSeen) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginForm()));
    } else {
      await prefs.setBool('intro_seen', true);
      Navigator.push(context,MaterialPageRoute(builder: (_) => const IntroScreen()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: Stack(
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
                          color: Colors.black26
                      ),
                      child: Center(
                        child: Text(
                          "B",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 65,
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
                    child:  Text("Boxcom", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18),)
                )
            )

          ],
        )
    );
  }
}




