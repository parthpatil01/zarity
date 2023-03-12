import 'package:assignment/settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  var name = 'John doe';
  int _radioValue = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFF02012D),
      appBar: AppBar(
        backgroundColor: Color(0xFF02012D),
        elevation: 0,
        title: Row(
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
                print('pressed this');
                Navigator.pushNamed(context, '/settings');
              },
            ),
            Text(
              '   Good Afternoon \n   $name',
              style: TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/v1.png'),
            onPressed: () {
              // Implement navigation to shopping cart page here...
              print('Click Action2');
            },
          ),
          IconButton(
            padding: EdgeInsets.all(10.0),
            icon: Image.asset('assets/images/v2.png'),
            onPressed: () {
              // Implement navigation to shopping cart page here...
              print('Click Action2');
            },
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(13, 20, 13, 13),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return StatefulBuilder(builder: (context, setState) {
                            return StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("tasks")
                                    .where("dueDate", isEqualTo: _radioValue)
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {


                                  }
                                  final userSnapshot = snapshot.data?.docs;
                                  if (userSnapshot!.isEmpty) {
                                    return const Text(
                                      "no data",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    );
                                  }
                                  return Scaffold(
                                      backgroundColor: Colors.black,
                                      body: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xff6774cb),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 10, 10, 10),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Due Dates for Tasks',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Transform.scale(
                                                    scale: 0.7,
                                                    child: Radio(
                                                      value: 0,
                                                      groupValue: _radioValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _radioValue = value!;
                                                        });
                                                      },
                                                      activeColor:
                                                          Color(0xffFFBD11),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Immidiate',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.white),
                                                  ),
                                                  Transform.scale(
                                                    scale: 0.7,
                                                    child: Radio(
                                                      value: 1,
                                                      groupValue: _radioValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _radioValue = value!;
                                                        });
                                                      },
                                                      activeColor:
                                                          Color(0xffFFBD11),
                                                    ),
                                                  ),
                                                  Text(
                                                    'This Week',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.white),
                                                  ),
                                                  Transform.scale(
                                                    scale: 0.7,
                                                    child: Radio(
                                                      value: 2,
                                                      groupValue: _radioValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _radioValue = value!;
                                                        });
                                                      },
                                                      activeColor:
                                                          Color(0xffFFBD11),
                                                    ),
                                                  ),
                                                  Text(
                                                    'This Month',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                  child: ListView.builder(
                                                      itemCount:
                                                          userSnapshot.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return ListTile(
                                                          onTap: () {
                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    "CTA EVENT",
                                                                toastLength: Toast
                                                                    .LENGTH_SHORT,
                                                                gravity:
                                                                    ToastGravity
                                                                        .CENTER,
                                                                timeInSecForIosWeb:
                                                                    1,
                                                                backgroundColor:
                                                                    Colors.red,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                fontSize: 16.0);
                                                          },
                                                          title: Text(
                                                            userSnapshot[index]
                                                                ["task"],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15),
                                                          ),
                                                          trailing: Text(
                                                            userSnapshot[index]
                                                                ["status"],
                                                            style: TextStyle(
                                                                color: userSnapshot[index]
                                                                            [
                                                                            "status"] ==
                                                                        "Finished"
                                                                    ? Colors
                                                                        .greenAccent
                                                                    : Colors
                                                                        .red,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        );
                                                      }))
                                            ],
                                          ),
                                        ),
                                      ));
                                });
                          });
                        });
                  },
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xff1B2152),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(35), // Image radius
                            child: Image.asset(
                              'assets/images/circluar.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          'Please complete your profile to book \nconsultations.',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(width: 25)
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    'Section Title 1',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Expanded(
                                child: AlertDialog(
                                  title: Text('Welcome'),
                                  content: Text('CTA 1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  actions: [
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                      ),
                                      onPressed: () {},
                                      child: Text('CANCEL'),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
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
                              Image.asset('assets/images/cta1.png'),
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
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Expanded(
                                child: AlertDialog(
                                  title: Text('Welcome back'),
                                  content: Text('CTA 2',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  actions: [
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                      ),
                                      onPressed: () {},
                                      child: Text('CANCEL'),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
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
                              Image.asset('assets/images/cta2.png'),
                              Text(
                                'CTA 2',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Expanded(
                                child: AlertDialog(
                                  title: Text('Welcome again'),
                                  content: Text('CTA 3',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  actions: [
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                      ),
                                      onPressed: () {},
                                      child: Text('CANCEL'),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
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
                              Image.asset('assets/images/cta3.png'),
                              Text(
                                'CTA 3',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    'Section Title 2',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
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
                ),
                Container(
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
                          child: Text(
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
                              return Container(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xFF02012D),
                                              width: 1.5))),
                                  child: ListTile(
                                      contentPadding: EdgeInsets.all(5),
                                      leading:
                                          Image.asset('assets/images/list.png'),
                                      title: Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const Text('Article Title',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white)),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 5.0),
                                            child: const Text(
                                                'Article excerpt description that runs two lines long shown here',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.white)),
                                          ),
                                        ],
                                      ))));
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
                ),
              ],
            ),
          )),
      bottomNavigationBar: buildMyNavBar(context),
    ));
  }

  int pageIndex = 0;

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(13, 10, 13, 20),
      decoration: BoxDecoration(
        color: Color(0xFF2E2C71),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: Image.asset(
                "assets/images/b1.png",
              )),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: Image.asset(
              "assets/images/b2.png",
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: Image.asset(
              "assets/images/b3.png",
            ),
          ),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: Image.asset(
                "assets/images/b4.png",
              )),
        ],
      ),
    );
  }
}

