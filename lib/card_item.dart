import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  const CardItem({Key? key}) : super(key: key);

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color(0xFF02012D), width: 1.5))),
        child: ListTile(
            contentPadding: EdgeInsets.all(5),
            leading: Image.asset('assets/images/list.png'),
            title: Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Article Title',
                    style: TextStyle(fontSize: 13, color: Colors.white)),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: const Text(
                      'Article excerpt description that runs two lines long shown here',
                      style: TextStyle(fontSize: 11, color: Colors.white)),
                ),
              ],
            ))));
  }
}
