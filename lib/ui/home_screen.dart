import 'package:flutter/material.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:inp_interecole/theme.dart';
import 'package:rxdart/rxdart.dart';
import 'package:inp_interecole/keys.dart';
import 'package:inp_interecole/interecole.dart';
import 'package:inp_interecole/localization.dart';
import 'package:inp_interecole/widgets/basketball_list.dart';
import 'package:inp_interecole/widgets/football_list.dart';
import 'package:inp_interecole/widgets/volleyball_list.dart';
import 'package:inp_interecole/widgets/handball_list.dart';

enum TabsDemoStyle {
  iconsAndText,
  iconsOnly,
  textOnly
}

class _Page {
  const _Page({this.text, this.key});
  final String text;
  final Key key;
}

//TODO: use localization instead
List<_Page> _allPages = <_Page>[
  _Page(key: ArchSampleKeys.football, text: 'FOOTBALL'),
  _Page(key: ArchSampleKeys.basketball, text: 'BASKETBALL'),
  _Page(key: ArchSampleKeys.volleyball, text: 'VOLLEYBALL'),
  _Page(key: ArchSampleKeys.handball, text: 'HANDBALL')
];

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key ?? ArchSampleKeys.homeScreen);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  TabsDemoStyle _demoStyle = TabsDemoStyle.textOnly;
  bool _customIndicator = false;
  Key _defaultTabKey = ArchSampleKeys.football;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _allPages.length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Decoration getIndicator() {
    if (!_customIndicator)
      return const UnderlineTabIndicator();

    switch(_demoStyle) {
      case TabsDemoStyle.iconsAndText:
        return ShapeDecoration(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            side: BorderSide(
              color: Colors.white24,
              width: 2.0,
            ),
          ) + const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            side: BorderSide(
              color: Colors.transparent,
              width: 4.0,
            ),
          ),
        );

      case TabsDemoStyle.iconsOnly:
        return ShapeDecoration(
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.white24,
              width: 4.0,
            ),
          ) + const CircleBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 4.0,
            ),
          ),
        );

      case TabsDemoStyle.textOnly:
        return ShapeDecoration(
          shape: const StadiumBorder(
            side: BorderSide(
              color: Colors.white24,
              width: 2.0,
            ),
          ) + const StadiumBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 4.0,
            ),
          ),
        );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(BlocLocalizations.of(context).appTitle),
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          indicator: getIndicator(),
          tabs: _allPages.map<Tab>((_Page page) {
            return Tab(text: page.text);
          }).toList(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help,
                semanticLabel: ArchSampleLocalizations.of(context).about,
                color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, ArchSampleRoutes.about);
            },
          )
        ],
      ),
      body: TabBarView(
          controller: _controller,
          children: _allPages.map<Widget>((_Page page) {
            if (page.key == ArchSampleKeys.football)
              return new FootballList(key: ArchSampleKeys.football);
            else if (page.key == ArchSampleKeys.basketball)
              return new BasketballList(key: ArchSampleKeys.basketball);
            else if (page.key == ArchSampleKeys.volleyball)
              return new VolleyballList(key: ArchSampleKeys.volleyball);
            else if (page.key == ArchSampleKeys.handball)
              return new HandballList(key: ArchSampleKeys.handball);
          }).toList()),
    );
  }
}
