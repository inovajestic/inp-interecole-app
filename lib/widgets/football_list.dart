import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inp_interecole/widgets/football_item.dart';
import 'package:inp_interecole/widgets/loading.dart';
import 'package:inp_interecole/models/football.dart';

class FootballList extends StatefulWidget {

  FootballList({Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return FootballListState();
  }

}

class FootballListState extends State<FootballList> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('football').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new LoadingSpinner();

        return _buildFootballList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildFootballList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) =>  _buildFootballItem(context, data)).toList(),
    );

  }

  Widget _buildFootballItem(BuildContext context, DocumentSnapshot data) {
    final rencontre = Football.fromSnapshot(data);

    return FootballItem(rencontre: rencontre);
  }
}