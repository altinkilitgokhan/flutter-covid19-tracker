import 'dart:math';

import 'package:covid19/cardMenu.dart';
import 'package:flutter/material.dart';
import 'package:covid19/barDesign.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;

  bool selectedWorld = true;
  bool selectedAll = false;
  bool selectedCountry = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AirAsiaBar(height: 210.0),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 40.0),
              child: new Column(
                children: <Widget>[
                  _buildButtonsRow(),
                  cardMenu(page: page),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsRow() {
    Color backgroundColorWorld = selectedWorld ? Colors.white : Colors.transparent;
    Color backgroundColorAll = selectedAll ? Colors.white : Colors.transparent;
    Color backgroundColorCountry = selectedCountry ? Colors.white : Colors.transparent;
    Color textColorWorld = selectedWorld ? Colors.green[900] : Colors.white;
    Color textColorAll = selectedAll ? Colors.green[900] : Colors.white;
    Color textColorCountry = selectedCountry ? Colors.green[900] : Colors.white;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 36.0,
              child: new RaisedButton(
                textColor: textColorWorld,
                color: backgroundColorWorld,
                child: Text("World"),
                onPressed: () {
                  //Navigator.push(context,MaterialPageRoute(builder: (context) => InterstitialAdPage()));
                  selectedWorld = true;
                  selectedAll = false;
                  selectedCountry = false;
                  page = 0;
                  setState(() {
                    child: cardMenu(page: page);
                  });

                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              height: 36.0,
              child: new RaisedButton(
                textColor: textColorAll,
                color: backgroundColorAll,
                child: Text("All Countries"),
                onPressed: () {
                  //Navigator.push(context,MaterialPageRoute(builder: (context) => InterstitialAdPage()));
                  selectedWorld = false;
                  selectedAll = true;
                  selectedCountry = false;
                  page = 1;
                  setState(() {
                    child: cardMenu(page: page);
                  });
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              height: 36.0,
              child: new RaisedButton(
                textColor: textColorCountry,
                color: backgroundColorCountry,
                child: Text("Country"),
                onPressed: () {
                  //Navigator.push(context,MaterialPageRoute(builder: (context) => InterstitialAdPage()));
                  selectedWorld = false;
                  selectedAll = false;
                  selectedCountry = true;
                  page = 2;
                  setState(() {
                    child: cardMenu(page: page);
                  });
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

