import 'package:assignment/section_tiles.dart';
import 'package:flutter/material.dart';

class SectionOne extends StatefulWidget {
  const SectionOne({Key? key}) : super(key: key);

  @override
  State<SectionOne> createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          SectionTile('Welcome', '1'),
          SectionTile('Welcome back', '2'),
          SectionTile('Welcome again', '3'),
        ],
      ),
    );
  }
}
