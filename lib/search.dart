import 'package:flutter/material.dart';

class search extends StatefulWidget{

  @override
  SearchState createState() => new SearchState();
}

class SearchState extends State<search>{

  FocusNode focusNode = new FocusNode();  //焦点

  _requestFocus(){
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }
  _getText(String text){

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Stack(
              children: <Widget>[

                Container(

                  alignment: Alignment.centerLeft,  //对齐方式，垂直居中，水平居左
                  height: 45.0,
                  margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                  decoration:BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.0, color: Colors.green)),
                  ),


                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(

                          focusNode: _requestFocus(),//回调？？？

                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          onChanged: (String text){},

                          decoration: InputDecoration(
                            hintText: '搜索', border: InputBorder.none
                          ),
                        ),
                      ),


                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                    ],


                  ),

                ),

              ],
            ),


            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                '搜索指定文章',
                style:  TextStyle(fontSize: 16.0,color: Color(0xffb5b5b5)),

              ),
            ),


            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    '朋友圈',
                    style:  TextStyle(fontSize: 16.0,color: Color(0xffb5b5b5)),
                  ),
                  Text(
                    '文章',
                    style:  TextStyle(fontSize: 16.0,color: Color(0xffb5b5b5)),
                  ),

                  Text(
                    '公众号',
                    style:  TextStyle(fontSize: 16.0,color: Color(0xffb5b5b5)),
                  ),


                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    '小程序',
                    style:  TextStyle(fontSize: 16.0,color: Color(0xffb5b5b5)),
                  ),
                  Text(
                    '音乐',
                    style:  TextStyle(fontSize: 16.0,color: Color(0xffb5b5b5)),
                  ),

                  Text(
                    '表情',
                    style:  TextStyle(fontSize: 16.0,color: Color(0xffb5b5b5)),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}