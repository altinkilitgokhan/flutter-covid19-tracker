import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomePageCountry extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePageCountry> {
  List data;
  List countries;
  int selectedValue = 840;
  int cases ;
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
            padding: EdgeInsets.fromLTRB(15,50,15,15),
            child: Menu(),
            //child: DropDown(data),
        )

    );
  }

  Widget DropDown(List datas){
    if (datas != null ) {
      return DropdownButton(
        isExpanded: true,
        items: datas.map((item) {
          return new DropdownMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.network(item['countryInfo']['flag'],width: 30,),
                  SizedBox(width: 25),
                  Text(item['country'], style: TextStyle(fontSize: 12),),
                ],
              ),
            value: item['countryInfo']['_id'],
          );
        }).toList(),
        hint: Text("Ülke Seç"),
        onChanged: (newVal){
          setState(() {
            selectedValue = newVal;
            for (var index = 0; index<datas.length; index++){
              if(datas[index]['countryInfo']['_id'] == newVal){
                cases = index;
              }
            }
            print (cases);
          });
        },
        value: selectedValue,
      );
    }
    else{
      return new Center(
        child: CircularProgressIndicator(),
      );
    }
  }
  Widget Menu(){
    if(data != null && cases != null) {
      return new Column(
        children: <Widget>[
          Container(
            width: 540,
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                child: DropDown(data),
              ),
            ),
          ),
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Container(
                    width: 540,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Cases",
                              style: TextStyle(
                                fontFamily: "Quantify",
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Divider(thickness: 2,),
                          Text(data[cases]['cases'].toString(),
                            style: TextStyle(
                                fontFamily: 'Quantify',
                                fontSize: 24
                            ),
                          )
                        ],
                      ),
                    )
                )
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Container(
                    height: 100,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 40,
                          child: Center(
                            child: Text(
                              "Deaths",
                              style: TextStyle(
                                fontFamily: "Quantify",
                                fontSize: 18,
                              ),
                            ),
                          ),

                        ),

                        Divider(thickness: 2,indent: 8,endIndent: 8,),
                        Container(
                          height: 40,
                          child: Center(
                            child: Text(data[cases]['deaths'].toString(),
                              style: TextStyle(
                                  fontFamily: 'Quantify',
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Container(
                    height: 100,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 40,
                          child: Center(
                            child: Text(
                              "Recovered",
                              style: TextStyle(
                                fontFamily: "Quantify",
                                fontSize: 18,
                              ),
                            ),
                          ),

                        ),

                        Divider(thickness: 2,indent: 8,endIndent: 8,),
                        Container(
                          height: 40,
                          child: Center(
                            child: Text(data[cases]['recovered'].toString(),
                              style: TextStyle(
                                  fontFamily: 'Quantify',
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Container(
                    height: 100,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 40,
                          child: Center(
                            child: Text(
                              "Critical",
                              style: TextStyle(
                                fontFamily: "Quantify",
                                fontSize: 18,
                              ),
                            ),
                          ),

                        ),

                        Divider(thickness: 2,indent: 8,endIndent: 8,),
                        Container(
                          height: 40,
                          child: Center(
                            child: Text(data[cases]['critical'].toString(),
                              style: TextStyle(
                                  fontFamily: 'Quantify',
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    }
    else{
      return new Center(
        child: DropDown(data),
      );
    }
  }
}