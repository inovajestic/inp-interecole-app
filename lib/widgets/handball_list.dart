import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inp_interecole/widgets/handball_item.dart';
import 'package:inp_interecole/widgets/loading.dart';
import 'package:inp_interecole/models/handball.dart';

class HandballList extends StatefulWidget {

  HandballList({Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return HandballListState();
  }

}

class HandballListState extends State<HandballList> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('handball').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new LoadingSpinner();

        return _buildHandballList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildHandballList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) =>  _buildHandballItem(context, data)).toList(),
    );
  }

  Widget _buildHandballItem(BuildContext context, DocumentSnapshot data) {
    final rencontre = Handball.fromSnapshot(data);

    return HandballItem(rencontre: rencontre);
  }
}