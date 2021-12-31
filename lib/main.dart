import 'package:boxcom/my_app.dart';
import 'package:boxcom/pages/favourites/providers/favourite_article_provider.dart';
import 'package:boxcom/pages/favourites/providers/favourite_product_provider.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/controller/boutique_provider.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/controller/providers/boutique_members_provider.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/controller/providers/boutique_partners_provider.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/controller/providers/my_boutique_members_provider.dart';
import 'package:boxcom/pages/home_page/tabs/boutique_tab/controller/providers/my_boutique_partners_provider.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/controller/enterprise_provider.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/controller/providers/enterprise_members_provider.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/controller/providers/enterprise_partners_provider.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/controller/providers/my_enterprise_members_provider.dart';
import 'package:boxcom/pages/home_page/tabs/enterprise_tab/controller/providers/my_enterprise_partners_provider.dart';
import 'package:boxcom/util/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'util/language_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) =>  BoutiqueMembersProvider()),
      ChangeNotifierProvider(create: (_) => BoutiquePartnersProvider()),
      ChangeNotifierProvider(create: (_) => EnterpriseMembersProvider()),
      ChangeNotifierProvider(create: (_) => EnterprisePartnersProvider()),
      ChangeNotifierProvider(create: (_) =>  MyBoutiqueMembersProvider()),
      ChangeNotifierProvider(create: (_) => MyBoutiquePartnersProvider()),
      ChangeNotifierProvider(create: (_) => MyEnterpriseMembersProvider()),
      ChangeNotifierProvider(create: (_) => MyEnterprisePartnersProvider()),
      ChangeNotifierProvider(create: (_) => FavouriteProducts()),
      ChangeNotifierProvider(create: (_) => FavouriteArticles()),
      ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ChangeNotifierProvider(create: (_) => BoutiqueProvider()),
      ChangeNotifierProvider(create: (_) =>  EnterpriseProvider()),
      ChangeNotifierProvider(create: (_) =>  LocaleProvider())
    ],
    child: const MyApp(),
  ));
}

