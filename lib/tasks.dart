import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TasksSection extends StatefulWidget {
  const TasksSection({Key? key}) : super(key: key);

  @override
  State<TasksSection> createState() => _TasksSectionState();
}

class _TasksSectionState extends State<TasksSection> {
  int _radioValue = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("tasks")
            .where("dueDate", isEqualTo: _radioValue)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                backgroundColor: Colors.black,
                body: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xff6774cb),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child:
                            Column(children: [CircularProgressIndicator()]))));
          }
          final userSnapshot = snapshot.data?.docs;
          if (userSnapshot!.isEmpty) {
            return const Text(
              "no data",
              style: TextStyle(color: Colors.black, fontSize: 20),
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
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Column(
                    children: [
                      const Text(
                        'Due Dates for Tasks',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: <Widget>[
                          radioButton(0),
                          const Text('Immidiate', style: TextStyle(fontSize: 15.0, color: Colors.white),),
                          radioButton(1),
                          const Text('This Week', style: TextStyle(fontSize: 15.0, color: Colors.white),),
                          radioButton(2),
                          const Text('This Month', style: TextStyle(fontSize: 15.0, color: Colors.white),),
                        ],
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: userSnapshot.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Fluttertoast.showToast(
                                        msg: "CTA EVENT",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  },
                                  title: Text(
                                    userSnapshot[index]["task"],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  trailing: Text(
                                    userSnapshot[index]["status"],
                                    style: TextStyle(
                                        color: userSnapshot[index]["status"] == "Finished" ? Colors.greenAccent : Colors.red,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }))
                    ],
                  ),
                ),
              ));
        });
  }

  radioButton(int i) {
    return Transform.scale(
      scale: 0.7,
      child: Radio(
        value: i,
        groupValue: _radioValue,
        onChanged: (value) {
          setState(() {
            _radioValue = value!;
          });
        },
        activeColor: Color(0xffFFBD11),
      ),
    );
  }
}
