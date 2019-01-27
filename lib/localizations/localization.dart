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

  String get about => Intl.message(
        'A propos',
        name: 'about',
        args: [],
        locale: locale.toString(),
      );

  String get descInova => Intl.message(
        '« Inova – La Junior Entreprise STIC » association à vocation économique et pédagogique, et à but non lucratif, des étudiants de l’association des Ingénieurs STIC',
        name: 'descInova',
        args: [],
        locale: locale.toString(),
      );

  String get inovaEmail => Intl.message(
    'inova.jestic@gmail.com',
    name: 'inovaEmail',
    args: [],
    locale: locale.toString(),
  );

  String get inovaContact1 => Intl.message(
    '+225 49 63 12 23',
    name: 'inovaContact1',
    args: [],
    locale: locale.toString(),
  );

  String get inovaContact2 => Intl.message(
    '+225 44 28 62 65',
    name: 'inovaContact2',
    args: [],
    locale: locale.toString(),
  );

  String get developer => Intl.message(
        'Développeur :',
        name: 'developer',
        args: [],
        locale: locale.toString(),
      );

  String get hommes => Intl.message(
    'Hommes',
    name: 'hommes',
    args: [],
    locale: locale.toString(),
  );

  String get dames => Intl.message(
    'Dames',
    name: 'dames',
    args: [],
    locale: locale.toString(),
  );

  String get developerName => Intl.message(
    'MOLOU Yao Clair Samson',
    name: 'developerName',
    args: [],
    locale: locale.toString(),
  );

  String get developerStudy => Intl.message(
    'Elève-Ingénieur en STIC / INFO 3',
    name: 'developerName',
    args: [],
    locale: locale.toString(),
  );

  String get contact => Intl.message(
    'Contacts :',
    name: 'contacts',
    args: [],
    locale: locale.toString(),
  );

  String get developerEmail => Intl.message(
    'samsonmolou@gmail.com',
    name: 'developerEmail',
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
