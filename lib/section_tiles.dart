import 'package:flutter/material.dart';

class SectionTile extends StatefulWidget {

  final String title;
  final String num;
  const SectionTile(this.title, this.num);

  @override
  State<SectionTile> createState() => _SectionTileState();
}

class _SectionTileState extends State<SectionTile> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Expanded(
              child: AlertDialog(
                title: Text(widget.title),
                content: Text(
                  'CTA ${widget.num}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                actions: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(
                          Colors.blue),
                    ),
                    onPressed: () {},
                    child: Text('CANCEL'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(
                          Colors.blue),
                    ),
                    onPressed: () {},
                    child: Text('ACCEPT'),
                  ),
                ],
              ),
            );
          },
        );
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 122,
        width: 98,
        decoration: const BoxDecoration(
          color: Color(0xff1B2152),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/cta${widget.num}.png'),
            Text(
              'CTA 1',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
