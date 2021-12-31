import 'package:boxcom/pages/authentication/login.dart';
import 'package:boxcom/pages/home_page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';



class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) =>
      SafeArea(
          child: IntroductionScreen(
            pages: [
              PageViewModel(
                title: "Discover Enterprises",
                body: "Discover ENterprises and Stores aroung you.",
                image: SvgPicture.asset(
                  "assets/svg/discover.svg",
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.45,
                ),

              ),


              PageViewModel(
                title: "Connect with Enterprises",
                body: "Connect with other enterprises around you.",
                image: SvgPicture.asset(
                  "assets/svg/connect.svg",
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.45,
                ),

              ),

              PageViewModel(
                title: "Shop Products",
                body: "Shop for products which you need.",
                image: SvgPicture.asset(
                  "assets/svg/shop.svg",
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.5,
                ),
              ),


            ],
            done: const Text('Finish'),
            onDone: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginForm()));
            },
            showSkipButton: true,
            showNextButton: true,
            dotsDecorator: const DotsDecorator(
                activeColor: Color(0xFF00172D), activeSize: Size(22, 10)),
            next: const Icon(Icons.arrow_forward),
            skip: const Text("Skip"),
            onSkip: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginForm()));
            },

          )

      );
}