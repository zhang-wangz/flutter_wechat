import 'package:flutter/material.dart';
import 'dart:async';

class loadingPage extends StatefulWidget{
  @override
  _loadingstate createState() => new _loadingstate();
}

class _loadingstate extends State<loadingPage>{

  @override
  void initState(){
    super.initState();
    new Future.delayed(Duration(seconds: 3),(){
      print("flutter 高仿微信启动");
      Navigator.of(context).pushReplacementNamed("app");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: Image.asset("images/loading.jpg"),
    );
  }
}