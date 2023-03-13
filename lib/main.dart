import 'package:assignment/bottom_nav_bar.dart';
import 'package:assignment/section_one.dart';
import 'package:assignment/settings.dart';
import 'package:assignment/card_section.dart';
import 'package:assignment/task_section.dart';
import 'package:assignment/section_two.dart';
import 'main_title.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // runApp(const MyApp());

  runApp(MaterialApp(
    home: const MyHomePage(
      title: 'Demo',
    ),
    routes: {
      '/settings': (context) => SettingsClass(),
    },
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFF02012D),
      appBar: AppBar(
        backgroundColor: Color(0xFF02012D),
        elevation: 0,
        title: MainTitle(context),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/v1.png'),
            onPressed: () {},
          ),
          IconButton(
            padding: EdgeInsets.all(10.0),
            icon: Image.asset('assets/images/v2.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(13, 20, 13, 13),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                TaskSection(),
                sectionTitle(1),
                SectionOne(),
                sectionTitle(2),
                SectionTwo(),
                CardSection(),
              ],
            ),
          )),
      bottomNavigationBar: MyBottomNavigation(),
    ));
  }

  sectionTitle(int val) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Text(
        'Section Title $val',
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }

}
