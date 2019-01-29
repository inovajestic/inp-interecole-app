import 'package:flutter/material.dart';
import 'package:inp_interecole/localization.dart';
import 'package:inp_interecole/ui/home_screen.dart';
import 'package:inp_interecole/ui/about_screen.dart';
import 'package:inp_interecole/routes.dart';
import 'package:inp_interecole/interecole.dart';
import 'package:inp_interecole/app_id.dart' show ADMOB_APP_ID;


void main() {
  runApp(MaterialApp(
    title: BlocLocalizations().appTitle,
    theme: ArchSampleTheme.theme,
    localizationsDelegates: [
      ArchSampleLocalizationsDelegate(),
      InheritedWidgetLocalizationsDelegate(),
    ],
    routes: {
      ArchSampleRoutes.home: (context) {
        return HomeScreen();
      },
      ArchSampleRoutes.about: (context) {
        return AboutScreen();
      }
    },
  ));
}