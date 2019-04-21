import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './contact_vo.dart';

class ContactSiderList extends StatefulWidget{
  final List<ContactVO> items;//数据列表
  final IndexedWidgetBuilder headerBuilder;//头部//IndexedWidgetBuilder适用于ListView.builder 大量子项的时候
  final IndexedWidgetBuilder itemBuilder;//项目部分
  final IndexedWidgetBuilder sectionBuilder;//分组部分

  ContactSiderList({
    Key key,
    @required this.items,
    this.headerBuilder,
    @required this.itemBuilder,
    @required this.sectionBuilder,
  }) : super(key : key);

  @override
  ContactState createState() => new ContactState();

}

class ContactState extends State<ContactSiderList> implements SectionIndexer{

  Color _pressColor = Colors.transparent;//siderbar背影颜色,默认透明

  final ScrollController _scrollController = new ScrollController();//滚动条

  bool _onNotification(ScrollNotification notification){
    return true;
  }

  _isShowHeaderView(index){//是否显示头部
    if(index == 0 && widget.headerBuilder != null){
      return Offstage(//如果有内容则显示，设置为flase 使得固件显示
        offstage: false,
        child: widget.headerBuilder(context,index),
      );
    }
    return Container();//否则返回空的container
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Stack(
        children: <Widget>[

          //通用功能，列表加载更多处理 查
          NotificationListener(


            onNotification: _onNotification,//与上面形成回调


            child: ListView.builder(//渲染项
                controller: _scrollController,

                // list里面的内容不足一屏时，list都可以滑动//任何时候都可以滑动
               // physics: const AlwaysScrollableScrollPhysics(), //因为已经采用了listview.builder

                itemCount: widget.items.length, // 规定数据列表的数量

                itemBuilder: (BuildContext context,int index){
                  return Container(//最外围container包装
                    alignment: Alignment.centerLeft,

                    child: Column(
                      children: <Widget>[
                        _isShowHeaderView(index),//头部

                        Offstage(//offstage 主要来表示是否显示子项 false表示显示
                          //前面的分组部分 A，B，C，D....是否显示
                          offstage: _shouldShowHeader(index),//给sectionBuilder使用主要

                          child: widget.sectionBuilder(context,index),

                        ),

                        Column(
                          children: <Widget>[
                            widget.itemBuilder(context,index),
                          ],
                        ),

                      ],
                    ),


                  );
                }
            ),
          ),


          //排序字母 定位最右边
          Positioned(
            right: 0.0,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,  //计算=整个容器的高度
              width: 17.0,
              color: _pressColor,//默认的透明色
              child: GestureDetector(
                onTapDown: (TapDownDetails t) {
                  //手指按下
                  setState(() {
                    _pressColor = Colors.grey;
                  });
                },
                onTapUp: (TapUpDetails t) {
                  //手指弹起
                  setState(() {
                    _pressColor = Colors.transparent;
                  });
                },
                onVerticalDragStart: (DragStartDetails details) {
                  //开始垂直滑动
                  setState(() {
                    _pressColor = Colors.grey;
                  });
                },
                onVerticalDragEnd: (DragEndDetails details) {
                  //结束垂直滑动
                  setState(() {
                    _pressColor = Colors.transparent;
                  });
                },
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  //手指垂直滑动时
                },

                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: siderBarKey.length,
                    itemBuilder: (BuildContext context,int index){
                      return Container(
                        alignment: Alignment.center,
                        height: 18.0,
                        child: Text(siderBarKey[index]),
                      );
                    }
                    ),
              ),
            ),
          ),


        ],
      ),


    );
  }


  @override
  listScrollToPosition(int index) {
    //重要方法：根据滑动的字母返回listview中的位置。
    for (var i = 0; i < widget.items.length; i++) {
      if (siderBarKey[index] == "☆" || siderBarKey[index] == "↑") {
        _scrollController.jumpTo(0.0);
        setState(() {});
        return -1;
      } else if (widget.items[i].seationKey == siderBarKey[index]) {
        return i;
      }
    }
    return -1;
  }


  bool _shouldShowHeader(int position){
    if(position < 0){
      return false;
    }

    if(position == 0){
      return false;
    }

    if(position != 0 && widget.items[position].seationKey != widget.items[position - 1].seationKey){
      return false;
    }
    return true;
  }

}




abstract class SectionIndexer{
  listScrollToPosition(int index);
}

const siderBarKey = <String>[
  "↑",
  "☆",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "#"
];
