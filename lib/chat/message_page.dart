import 'package:flutter/material.dart';
import './message_data.dart';
import './message_item.dart';

class MessagePage extends StatefulWidget {

  @override
  MessagePageState createState() {
    return new MessagePageState();
  }
}


class MessagePageState extends State<MessagePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemCount: messagelist.length,
        itemBuilder: (BuildContext context, int index){
          return new Message_Item(messagelist[index]);
        }
      ),
    );
  }
}