import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tarot/features/friend/ui/widgets/chat_bar.dart';

class MessageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thắng béo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            reverse: true,
            itemBuilder: (context, index) => ListTile(
              title: Bubble(
                nip: BubbleNip.rightTop,
                alignment: Alignment.topRight,
                child: Text(
                  "dsadasdsd asdasdasd asdkjas hdasnd á.d ná,dn ,.asnd á,dn á,d ns nsad and .asnd  asdasdas ",
                  textAlign: TextAlign.start,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Tôi",
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            itemCount: 1,
          )),
          ChatBar(),
        ],
      ),
    );
  }
}
