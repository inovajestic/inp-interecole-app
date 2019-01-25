import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inp_interecole/widgets/basketball_item.dart';
import 'package:inp_interecole/widgets/loading.dart';
import 'package:inp_interecole/models/basketball.dart';

class BasketballList extends StatefulWidget {

  BasketballList({Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return BasketballListState();
  }

}

class BasketballListState extends State<BasketballList> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('basketball').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new LoadingSpinner();

        return _buildBasketballList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildBasketballList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) =>  _buildBasketballItem(context, data)).toList(),
    );
  }

  Widget _buildBasketballItem(BuildContext context, DocumentSnapshot data) {
    final rencontre = Basketball.fromSnapshot(data);

    return BasketballItem(rencontre: rencontre);
  }
}