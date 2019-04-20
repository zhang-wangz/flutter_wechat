import 'package:flutter/material.dart';


class TouchCallBack extends StatefulWidget{
  final Widget child;
  final VoidCallback onPressed;
  final bool isfeed;
  final Color background;

  TouchCallBack({Key key,
    @required this.child,
    @required this.onPressed,
    this.isfeed: true,
    this.background: const Color(0xffd8d8d8),

  }): super(key:key);//初始化

  @override
  TouchState createState() => TouchState();
}

class TouchState extends State<TouchCallBack>{
  Color  color= Colors.transparent;//透明色

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.onPressed,
      onPanDown: (d){
        if(widget.isfeed == false) return ;
        setState(() {
          color = widget.background;
        });
      },
      onPanCancel: (){
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }


}