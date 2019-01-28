import 'package:flutter/material.dart';
import 'package:inp_interecole/interecole.dart';

class AboutScreen extends StatelessWidget {
  final double _imageHeight = 256.0;

  AboutScreen({
    Key key,
  }) : super(key: key ?? ArchSampleKeys.aboutScreen);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(ArchSampleLocalizations.of(context).about),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/logo_inova.png',
                    fit: BoxFit.cover,
                    scale: 10.0,
                  ),
                ],
              ),
              Text(
                ArchSampleLocalizations.of(context).descInova,
                textAlign: TextAlign.center,
                style: theme.textTheme.body2,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 2.0),
              ),
              Text(
                ArchSampleLocalizations.of(context).contact,
                style: theme.textTheme.title,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 2.0),
              ),
              Text(
                ArchSampleLocalizations.of(context).inovaContact1,
                style: theme.textTheme.subtitle,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 2.0),
              ),
              Text(
                ArchSampleLocalizations.of(context).inovaContact2,
                style: theme.textTheme.subtitle,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 2.0),
              ),
              Text(
                ArchSampleLocalizations.of(context).inovaEmail,
                style: theme.textTheme.subtitle,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 2.0),
              ),
              Text(
                ArchSampleLocalizations.of(context).developer,
                style: theme.textTheme.title,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 2.0),
              ),
              Text(
                ArchSampleLocalizations.of(context).developerName,
                style: theme.textTheme.subtitle,
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
              ),
              Text(
                ArchSampleLocalizations.of(context).developerStudy,
                style: theme.textTheme.subtitle,
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
              ),
              Text(
                ArchSampleLocalizations.of(context).developerEmail,
                style: theme.textTheme.subtitle,
              ),
            ],
          ),
        ),
      )
    );
  }
}
