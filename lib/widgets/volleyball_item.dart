import 'package:flutter/material.dart';
import 'package:inp_interecole/models/volleyball.dart';
import 'package:inp_interecole/interecole.dart';

class VolleyballItem extends StatelessWidget {
  final Volleyball rencontre;
  VolleyballItem({@required this.rencontre});

  static const double height = 366;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Text(this.rencontre.journee,
                                  style: theme.textTheme.body2),
                              new Text(
                                  ArchSampleLocalizations.of(context).tiret),
                              new Text(this.rencontre.categorie,
                                  style: theme.textTheme.body2)
                            ],
                          ),
                          this.rencontre.enCours
                              ? !this.rencontre.estTerminee
                              ? Column(
                            children: <Widget>[
                              new Text(
                                ArchSampleLocalizations.of(context)
                                    .enCours,
                                style: TextStyle(
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.w500),
                              ),
                              new SizedBox(
                                width: 15.0,
                                child: LinearProgressIndicator(
                                  backgroundColor: theme.primaryColor,
                                ),
                              )
                            ],
                          )
                              : Container()
                              : this.rencontre.estTerminee
                              ? new Column(
                            children: <Widget>[
                              new Text(
                                ArchSampleLocalizations.of(context)
                                    .terminee,
                                style: TextStyle(
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                              : Container(),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: this.rencontre.enCours || this.rencontre.estTerminee ? Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          this.rencontre.scoreDomicile.toString(),
                                          style: theme.textTheme.display1,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                        ),
                                        Text(
                                          this.rencontre.setDomicile.toString(),
                                          style: theme.textTheme.title,
                                        ),
                                      ],
                                    ),
                                    Text(this.rencontre.domicile,
                                        style: theme.textTheme.title
                                            .copyWith(color: theme.accentColor))
                                  ],
                                ) : Column(
                                  children: <Widget>[
                                    Text(this.rencontre.domicile,
                                        style: theme.textTheme.title
                                            .copyWith(color: theme.accentColor, fontSize: 30.0))
                                  ],
                                )
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                      ArchSampleLocalizations.of(context).tiret,
                                      style: theme.textTheme.display2),
                                  Text(this.rencontre.temps,
                                      style: theme.textTheme.body2
                                          .copyWith(color: theme.accentColor))
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: this.rencontre.enCours || this.rencontre.estTerminee ? Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          this.rencontre.setExterieur.toString(),
                                          style: theme.textTheme.title,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                        ),
                                        Text(
                                          this.rencontre.scoreExterieur.toString(),
                                          style: theme.textTheme.display1,
                                        ),
                                      ],
                                    ),
                                    Text(this.rencontre.exterieur,
                                        style: theme.textTheme.title
                                            .copyWith(color: theme.accentColor))
                                  ],
                                ) : Column(
                                  children: <Widget>[
                                    Text(this.rencontre.exterieur,
                                        style: theme.textTheme.title
                                            .copyWith(color: theme.accentColor, fontSize: 30.0))
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.location_on, size: 18.0),
                                Text(this.rencontre.terrain)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.access_time, size: 18.0),
                                Text(this.rencontre.dateHeure.toString())
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
