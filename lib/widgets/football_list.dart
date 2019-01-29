import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inp_interecole/widgets/football_item.dart';
import 'package:inp_interecole/widgets/loading.dart';
import 'package:inp_interecole/models/football.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:inp_interecole/admob/admob.dart';

class FootballList extends StatefulWidget {
  FootballList({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FootballListState();
  }
}

class FootballListState extends State<FootballList> {
  // Compte le nombre de fois que la liste est appélé afin de lancer la publicité.
  // Si le compte est un multiple de 5, alors on montre la vidéo
  int _counter = 0;

  InterstitialAd interstitialAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    interstitialAd = AdMob.buildFootballInterstitialAd()..load();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    interstitialAd..load()..show();

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('football').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new LoadingSpinner();

        return _buildFootballList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildFootballList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 60.0),
      children:
          snapshot.map((data) => _buildFootballItem(context, data)).toList(),
    );
  }

  Widget _buildFootballItem(BuildContext context, DocumentSnapshot data) {
    final rencontre = Football.fromSnapshot(data);

    return FootballItem(rencontre: rencontre);
  }
}
