import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inp_interecole/widgets/volleyball_item.dart';
import 'package:inp_interecole/widgets/loading.dart';
import 'package:inp_interecole/models/volleyball.dart';

class VolleyballList extends StatefulWidget {

  VolleyballList({Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return VolleyballListState();
  }

}

class VolleyballListState extends State<VolleyballList> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('volleyball').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new LoadingSpinner();

        return _buildVolleyballList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildVolleyballList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) =>  _buildVolleyballItem(context, data)).toList(),
    );
  }

  Widget _buildVolleyballItem(BuildContext context, DocumentSnapshot data) {
    final rencontre = Volleyball.fromSnapshot(data);

    return VolleyballItem(rencontre: rencontre);
  }
}