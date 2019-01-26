import 'package:flutter/material.dart';
import 'package:inp_interecole/interecole.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({
    Key key,
  }) : super(key: key ?? ArchSampleKeys.aboutScreen);

  @override
  State createState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ArchSampleLocalizations.of(context).about
        ),
      ),
    );
  }
}

