
import 'package:boxcom/pages/authentication/register.dart';
import 'package:boxcom/pages/screens.dart';
import 'package:boxcom/widgets/form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value, style: TextStyle(color: Colors.white),)));
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
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

            MyFormField(
                controller: emailController,
                hint: 'Email',
                maxLines: 1,
                icon:const Icon(Icons.email, color: Colors.black54,)
            ),


            const SizedBox(height: 15,),

           MyFormField(
             controller: passwordController,
             hint: 'PassWord',
             maxLines: 1,
             icon:const Icon(Icons.lock,  color: Colors.black54,)
             ),


            const SizedBox(height: 20,),


            InkWell(
              onTap: () async{
                try{
                  var email = emailController.value.text;
                  var password = passwordController.value.text;

                 print("$email, $password");
                 Navigator.push(context, MaterialPageRoute(builder: (_) => const MainHomePage()));


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
               Text(
                  AppLocalizations.of(context)!.dontHaveAnAccount,
                  style: const TextStyle(
                    fontSize: 17,
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
