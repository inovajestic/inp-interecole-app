import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:inp_interecole/localizations/messages_all.dart';
import 'package:intl/intl.dart';

class ArchSampleLocalizations {
  ArchSampleLocalizations(this.locale);

  final Locale locale;

  static Future<ArchSampleLocalizations> load(Locale locale) {
    return initializeMessages(locale.toString()).then((_) {
      return ArchSampleLocalizations(locale);
    });
  }

  static ArchSampleLocalizations of(BuildContext context) {
    return Localizations.of<ArchSampleLocalizations>(
        context, ArchSampleLocalizations);
  }

  String get football => Intl.message(
    'football',
    name: 'football',
    args: [],
    locale: locale.toString(),
  );

  String get basketball => Intl.message(
    'basketball',
    name: 'basketball',
    args: [],
    locale: locale.toString(),
  );

  String get volleyball => Intl.message(
    'volleyball',
    name: 'volleyball',
    args: [],
    locale: locale.toString(),
  );

  String get handball => Intl.message(
    'handball',
    name: 'handball',
    args: [],
    locale: locale.toString(),
  );

  String get tiret => Intl.message(
    ' - ',
    name: 'tiret',
    args: [],
    locale: locale.toString(),
  );

  String get quartTemps => Intl.message(
    'Quart-temps',
    name: 'quartTemps',
    args: [],
    locale: locale.toString(),
  );

  String get duree => Intl.message(
    'Durée',
    name: 'duree',
    args: [],
    locale: locale.toString(),
  );

  String get terminee => Intl.message(
    'Terminée',
    name: 'terminee',
    args: [],
    locale: locale.toString(),
  );

  String get enCours => Intl.message(
    'En cours',
    name: 'enCours',
    args: [],
    locale: locale.toString(),
  );
}

class ArchSampleLocalizationsDelegate
    extends LocalizationsDelegate<ArchSampleLocalizations> {
  @override
  Future<ArchSampleLocalizations> load(Locale locale) =>
      ArchSampleLocalizations.load(locale);

  @override
  bool shouldReload(ArchSampleLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains("en");
}
