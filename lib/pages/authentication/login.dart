
import 'package:boxcom/pages/authentication/register.dart';
import 'package:boxcom/pages/screens.dart';
import 'package:boxcom/widgets/form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 15,),
            SvgPicture.asset(
              "assets/svg/login.svg",
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.45,
            ),

            const SizedBox(height: 15,),



            const SizedBox(height: 15,),

            myFormField(
                context,
                "Password",
                const Icon(Icons.lock, color: Colors.black54,),
                passwordController,
              1
            ),


            const SizedBox(height: 20,),


            InkWell(
              onTap: () async{
                try{
                  var email = emailController.value.text;
                  var password = passwordController.value.text;

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainHomePage()));


                } catch(e){


                }

              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width  * .65,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.cyan,
                      Colors.cyanAccent
                    ]
                  ),
                  borderRadius: BorderRadius.circular(30)
                ),

                child: const Center(
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                ),
              ),
            ),


            const SizedBox(height: 25,),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Text(
                  "Dont have an Account ?",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54
                  ),
                ),

                const SizedBox(width: 15,),


                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Register()));
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.cyan
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
