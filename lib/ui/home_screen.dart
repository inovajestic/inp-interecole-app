import 'package:flutter/material.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:inp_interecole/theme.dart';
import 'package:rxdart/rxdart.dart';
import 'package:inp_interecole/keys.dart';
import 'package:inp_interecole/interecole.dart';
import 'package:inp_interecole/localization.dart';

enum TabsDemoStyle {
  iconsAndText,
  iconsOnly,
  textOnly
}

class _Page {
  const _Page({this.text});
  final String text;
}

//TODO: use localization instead
List<_Page> _allPages = <_Page>[
  _Page(text: 'FOOTBALL'),
  _Page(text: 'BASKETBALL'),
  _Page(text: 'VOLLEYBALL'),
  _Page(text: 'HANDBALL')
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
      ),
      body: TabBarView(
          controller: _controller,
          children: _allPages.map<Widget>((_Page page) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: Center(
                    child: Icon(Icons.settings_input_component),
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}
