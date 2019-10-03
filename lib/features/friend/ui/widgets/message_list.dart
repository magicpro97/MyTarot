import 'package:flutter/material.dart';
import 'package:my_tarot/features/friend/ui/widgets/message_box.dart';

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text("Thắng béo"),
            subtitle: Text("This is a message"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => MessageBox())),
          ),
        ),
        itemCount: 1,
      ),
    );
  }
}
