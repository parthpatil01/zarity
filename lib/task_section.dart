import 'package:assignment/tasks.dart';
import 'package:flutter/material.dart';

class TaskSection extends StatefulWidget {
  const TaskSection({Key? key}) : super(key: key);

  @override
  State<TaskSection> createState() => _TaskSectionState();
}

class _TaskSectionState extends State<TaskSection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext bc) {
              return TasksSection();
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
    );
  }
}
