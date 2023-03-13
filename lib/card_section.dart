import 'package:assignment/card_item.dart';
import 'package:flutter/material.dart';

class CardSection extends StatefulWidget {
  const CardSection({Key? key}) : super(key: key);

  @override
  State<CardSection> createState() => _CardSectionState();
}

class _CardSectionState extends State<CardSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 328,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      decoration: const BoxDecoration(
        color: Color(0xff1B2152),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: const Text(
                'Card Title',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              )),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                // padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (BuildContext ctxt, int index) {
                  return const CardItem();
                },
              ),
            ),
          ),
          Container(
            height: 64,
            alignment: Alignment.center,
            child: Image.asset('assets/images/view.png'),
          )
        ],
      ),
    );
  }
}
