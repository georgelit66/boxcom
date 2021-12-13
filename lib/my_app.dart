import 'package:boxcom/pages/splash_screen/splash_page.dart';
import 'package:boxcom/util/theme_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  var theme = ThemeConfig();
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false,
        theme: theme.lightTheme
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return const SplashScreen();
  }
}
