import 'package:flutter/material.dart';

class SectionTwo extends StatelessWidget {
  const SectionTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: double.infinity,
      padding: EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Color(0xff1B2152),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              image: DecorationImage(
                  image: AssetImage('assets/images/doc.png'),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'Roe Rogan',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'subtext shown here',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                'Card Description',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          Image.asset('assets/images/button.png')
        ],
      ),
    );
  }
}
