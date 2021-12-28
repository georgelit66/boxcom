import 'package:boxcom/pages/splash_screen/splash_screen.dart';
import 'package:boxcom/util/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'util/language_provider.dart';


class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final notifier = context.watch<ThemeNotifier>();
    final localProvider = context.watch<LocaleProvider>();
    return MaterialApp(
    theme: notifier.darkTheme ? notifier.dark : notifier.light,
    debugShowCheckedModeBanner: false,
    locale: localProvider.locale,
    supportedLocales: L10n.all,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: const SplashScreen()
    );





  }
}

