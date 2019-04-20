import 'package:flutter/material.dart';
import 'package:wechat/common/touch_callback.dart';



class search extends StatefulWidget{

  @override
  SearchState createState() => new SearchState();
}

class SearchState extends State<search>{

  FocusNode focusNode = new FocusNode();  //当用户点击时获取这个widget的控制

  _requestFocus(){
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }


  _getText(String text){
      return TouchCallBack(
        isfeed: false,
        onPressed: (){},
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.0,color: Colors.green,
          ),
        ),
      );

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 25.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[



                TouchCallBack(//回调
                  isfeed:  false,
                  onPressed:  (){
                    Navigator.pop(context);//点击退出
                  },
                  child: Container(
                    height: 45.0,
                    margin: const EdgeInsets.only(left: 12.0, right: 10.0),
                    child: Icon(
                      Icons.chevron_left,//左箭头
                      color: Colors.black,
                    ),
                  ),
                ),




                Container(

                  alignment: Alignment.centerLeft,  //对齐方式，垂直居中，水平居左
                  height: 45.0,
                  margin: const EdgeInsets.only(left: 40.0, right: 30.0),

                  decoration:BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.0, color: Colors.green)),
                  ),


                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,//垂直与父组件

                    children: <Widget>[


                      Expanded(//用于将row，column，flex 剩余空间充满
                        child: TextField(//输入

                          focusNode: _requestFocus(),//回调，获取控制

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
                mainAxisAlignment: MainAxisAlignment.spaceAround,//与父组件一致
                children: <Widget>[
                  _getText("朋友圈"),
                  _getText("文章"),
                  _getText("公众号"),


                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText("小程序"),
                  _getText("音乐"),
                  _getText("表情"),



                ],
              ),
            ),
          ],
        ),


      ),
    );
  }
}