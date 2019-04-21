import 'package:flutter/material.dart';
import './message_data.dart';
import 'package:date_format/date_format.dart';
import '../common/touch_callback.dart';

class Message_Item extends StatelessWidget{
  final MessageData message;
  Message_Item(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 64.0,

      child: TouchCallBack(
        onPressed: (){

        },

        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 3.0, right:  13.0),
              child: Image.network(message.avatar,width: 70.0, height: 50.0,), // network 因为使用的是网络图片
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message.title,
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF353535),),
                    maxLines: 1,//最大行数
                    overflow: TextOverflow.ellipsis ,//溢出省略
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Text(
                    message.subTiltle,
                    style: TextStyle(fontSize: 15.0, color: Color(0xff999999),),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis ,
                  ),

                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.only(right: 12.0,top: 12.0),
              child: Text(
                formatDate(message.time, [HH,':',nn,':','ss']).toString(),
                style: TextStyle(fontSize: 14.0,color: Color(0xFFa9a9a9)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
