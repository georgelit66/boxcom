import 'package:boxcom/my_app.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/controller/boutique_provider.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/controller/enterprise_provider.dart';
import 'package:boxcom/util/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'util/language_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ChangeNotifierProvider(create: (_) => BoutiqueProvider()),
      ChangeNotifierProvider(create: (_) =>  EnterpriseProvider()),
      ChangeNotifierProvider(create: (_) =>  LocaleProvider())
    ],
    child: const MyApp(),
  ));
}

