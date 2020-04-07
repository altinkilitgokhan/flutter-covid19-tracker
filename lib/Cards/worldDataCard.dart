import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class worldTotalCase extends StatelessWidget {

  var quote;

  worldTotalCase({@required this.quote});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: Center(
                child: FutureBuilder<Quote>(
                    future: getQuote(),
                    // ignore: missing_return
                    builder: (context, snapshot){
                      if (snapshot.hasData){
                        return Center(
                          child: Container(
                            width: MediaQuery.of(context).copyWith().size.width,
                            height: MediaQuery.of(context).copyWith().size.height*818/1000,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Card(
                                    elevation: 4,
                                    color: Colors.grey[200],
                                    margin: const EdgeInsets.all(18.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                  child: Align(
                                                      alignment: Alignment.center,
                                                      child: SizedBox(
                                                        child: Text(
                                                          "Total Cases",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 30,
                                                            fontFamily: "Quantify",
                                                          ),
                                                        ),
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Divider(),
                                          Expanded(
                                            child: Container(
                                              height: 80,
                                              child: Card(
                                                elevation: 4,
                                                color: Colors.grey[300],
                                                margin: const EdgeInsets.fromLTRB(100, 0, 100, 8),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15.0)
                                                ),
                                                child: Container(
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${snapshot.data.cases.toString()}",
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        fontFamily: "Quantify",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    elevation: 4,
                                    color: Colors.grey[200],
                                    margin: const EdgeInsets.all(18.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                  child: Align(
                                                      alignment: Alignment.center,
                                                      child: SizedBox(
                                                        child: Text(
                                                          "Total Deaths",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 30,
                                                            fontFamily: "Quantify",
                                                          ),
                                                        ),
                                                      )
                                                  ),
                                                )
                                            ),
                                          ),
                                          Divider(),
                                          Expanded(
                                            child: Container(
                                              height: 80,
                                              child: Card(
                                                elevation: 4,
                                                color: Colors.grey[300],
                                                margin: const EdgeInsets.fromLTRB(100, 0, 100, 8),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15.0)
                                                ),
                                                child: Container(
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${snapshot.data.deaths.toString()}",
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        fontFamily: "Quantify",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    elevation: 4,
                                    color: Colors.grey[200],
                                    margin: const EdgeInsets.all(18.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                    child: Align(
                                                        alignment: Alignment.center,
                                                        child: SizedBox(
                                                          child: Text(
                                                            "Total Recovered",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              fontSize: 30,
                                                              fontFamily: "Quantify",
                                                            ),
                                                          ),
                                                        )
                                                    ),
                                                )
                                            ),
                                          ),
                                          Divider(),
                                          Expanded(
                                            child: Container(
                                              height: 80,
                                              child: Card(
                                                elevation: 4,
                                                color: Colors.grey[300],
                                                margin: const EdgeInsets.fromLTRB(100, 0, 100, 8),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15.0)
                                                ),
                                                child: Container(
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${snapshot.data.recovered.toString()}",
                                                      style: TextStyle(
                                                        fontSize: 25,
                                                        fontFamily: "Quantify",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )  ,
                          ),
                        );
                      } else if (snapshot.hasError) { //checks if the response throws an error
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    }
                )
            )
        )
    );
  }
  Future<Quote> getQuote() async {
    String url = 'https://corona.lmao.ninja/all';
    final response =
    await http.get(url, headers: {"Accept": "application/json"});


    if (response.statusCode == 200) {
      return Quote.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
       /* child: FutureBuilder<Quote>(
          future: getQuote(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return: Container(
                width: 390,
                height: 540,
                child: Table(
                  children: [
                    TableRow(children: [
                      Card()
    ]
    ]
    )
    };
    }
        )
        );*/

    /*return Card(
      elevation: 4,
      color: Colors.grey[200],
      margin: const EdgeInsets.all(18.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
      ),

      child: FutureBuilder<Quote>(
        future: getQuote(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                width: 300,
                height: 150,
                child: Table(
                  children: [
                    TableRow(children: [
                      Container(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 300,
                                  child: Text(
                                    "Total Cases",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: "NothingYouCouldDo",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                      )
                    ]),
                    TableRow(children: [
                      Container(
                        height: 80,
                        child: Card(
                          elevation: 4,
                          color: Colors.grey[300],
                          margin: const EdgeInsets.fromLTRB(100, 8, 100, 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${snapshot.data.author.toString()}",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "NothingYouCouldDo",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                )
            );
          }else if (snapshot.hasError) { //checks if the response throws an error
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        }

      )
    );
  }
  Future<Quote> getQuote() async {
    String url = 'https://corona.lmao.ninja/all';
    final response =
    await http.get(url, headers: {"Accept": "application/json"});


    if (response.statusCode == 200) {
      return Quote.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}*/

class Quote {
  final int cases;
  final int deaths;
  final int recovered;

  Quote({this.cases, this.deaths, this.recovered});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
        cases: json['cases'],
        deaths: json['deaths'],
        recovered: json['recovered']);
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}