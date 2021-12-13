
import 'package:boxcom/pages/authentication/register.dart';
import 'package:boxcom/widgets/form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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

            const SizedBox(height: 155,),

           myFormField(
             context,
             "Email",
               const Icon(Icons.email, color: Colors.black54,),
             emailController
           ),

            const SizedBox(height: 15,),

            myFormField(
                context,
                "Password",
                const Icon(Icons.password, color: Colors.black54,),
                passwordController
            ),


            const SizedBox(height: 20,),


            InkWell(
              onTap: () async{
                try{
                  var email = emailController.value.text;
                  var password = passwordController.value.text;


                } catch(e){


                }

              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width  * .65,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.greenAccent
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


                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.green
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
