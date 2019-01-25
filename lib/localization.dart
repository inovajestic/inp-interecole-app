import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';


class BlocLocalizations {
  static BlocLocalizations of(BuildContext context) {
    return Localizations.of<BlocLocalizations>(context, BlocLocalizations);
  }

  String get appTitle => "INP Inter-École";
}

class InheritedWidgetLocalizationsDelegate
    extends LocalizationsDelegate<BlocLocalizations> {
  @override
  Future<BlocLocalizations> load(Locale locale) =>
      Future(() => BlocLocalizations());

  @override
  bool shouldReload(InheritedWidgetLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains("en");
}
