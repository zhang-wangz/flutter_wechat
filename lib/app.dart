import 'package:flutter/material.dart';
import 'dart:async';

class App extends StatefulWidget{
  @override
  Mainstate createState()  =>  Mainstate();
}

class Mainstate extends State<App>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,//优先级
        onTap: ((index){

        }),
        items: [
          new BottomAppBar(),
        ],
      ),
    );
  }


}