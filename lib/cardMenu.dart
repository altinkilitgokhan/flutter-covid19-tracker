import 'package:covid19/Cards/allCountryInfoCard.dart';
import 'package:flutter/material.dart';
import 'package:covid19/Cards/worldDataCard.dart';
import 'package:covid19/Cards/countrySearch.dart';


class cardMenu extends StatefulWidget{
  final int page;

  const cardMenu({Key key, this.page}) : super(key: key);

  @override
  _cardMenuState createState() => _cardMenuState();
}

class _cardMenuState extends State<cardMenu> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).copyWith().size.width,
        height: MediaQuery.of(context).copyWith().size.height*818/1000,
        child: Menu(),



    );


  }

  Widget Menu() {
    if(widget.page == 0){
      print(widget.page);
      return worldTotalCase();
    }
    if(widget.page == 2){
      print(widget.page);
      return HomePageCountry();
    }
    if(widget.page == 1){
      print(widget.page);
      return HomePageInfo();
    }
  }
}