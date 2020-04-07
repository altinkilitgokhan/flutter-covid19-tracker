import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomePageInfo extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePageInfo> {
  List data;
  List countries;
  Future<String> getData() async{
    http.Response response = await http.get(Uri.encodeFull("https://corona.lmao.ninja/countries"),
    headers: {
      "Accept": "application/json"
    });

    this.setState(() {
      data = json.decode(response.body);
    });

    print (data[1]["countryInfo"]["flag"]);
    //datas = (data[1]["countryInfo"]["flag"]);
    //countries = (data[])
    return "Success!";
  }
  @override
  void initState() {
    super.initState();
    this.getData();
  }



  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
            child: new ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (context, index){
                  return new Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                                height: 100,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Image.network(
                                    data[index]["countryInfo"]["flag"],
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                )
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      data[index]["country"],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Quantify"
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: Card(
                                            elevation: 4,
                                            margin: const EdgeInsets.all(8.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            ),
                                            child: Container(
                                                height: 80,
                                                child: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 10),
                                                      child: Text(
                                                        "Cases",
                                                        style: TextStyle(
                                                            fontFamily: "Quantify"
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 5),
                                                      child: Text(data[index]["cases"].toString()),
                                                    ),
                                                  ],
                                                )
                                            ),
                                          )
                                      ),
                                      Expanded(
                                          child: Card(
                                            elevation: 4,
                                            margin: const EdgeInsets.all(8.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            ),
                                            child: Container(
                                                height: 80,
                                                child: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 10),
                                                      child: Text(
                                                        "Deaths",
                                                        style: TextStyle(
                                                            fontFamily: "Quantify"
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 5),
                                                      child: Text(data[index]["deaths"].toString()),
                                                    ),
                                                  ],
                                                )
                                            ),
                                          )
                                      ),
                                      Expanded(
                                          child: Card(
                                            elevation: 4,
                                            margin: const EdgeInsets.all(8.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0)
                                            ),
                                            child: Container(
                                                height: 80,
                                                child: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 10),
                                                      child: Text(
                                                        "Recover",
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontFamily: "Quantify",
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 5),
                                                      child: Text(data[index]["recovered"].toString()),
                                                    ),
                                                  ],
                                                )
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                  );
                }
            )
        )

    );
  }
}
String checkDatas(String data){
  if (data != null){
    return data;
  }else {
    return "https://picsum.photos/250?image=9";
  }
}