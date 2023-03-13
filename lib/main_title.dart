import 'package:flutter/material.dart';

class MainTitle extends StatefulWidget {

  final BuildContext mContext;
  const MainTitle(this.mContext);

  @override
  State<MainTitle> createState() => _MainTitleState();
}

class _MainTitleState extends State<MainTitle> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/example-c59c5.appspot.com/o/Rectangle%20138550.png?alt=media&token=44f0520c-447f-4d3e-b7d2-a18130bf1eef'),
                  fit: BoxFit.fill),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(widget.mContext, '/settings');
          },
        ),
        Text(
          '   Good Afternoon \n   John doe',
          style: TextStyle(fontSize: 15, color: Colors.white),
        )
      ],
    );
  }
}
