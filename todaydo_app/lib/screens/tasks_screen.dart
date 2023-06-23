// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import '../screens/add_task_screen.dart';
import '../screens/test.dart';
import '../widgets/tasks_list.dart';

// ignore: must_be_immutable
DateTime dateTime = DateTime.now();
String date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";

class TasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Provider.of<TaskData>(context, listen: false).getTasksForDate(date);
    return Scaffold(
      backgroundColor: Colors.teal[400],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(date: date),
              ),
            ),
          );
        },
        backgroundColor: Colors.indigo[400],
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.playlist_add_check, size: 40, color: Colors.white),
                SizedBox(width: 20),
                Text(
                  'To Do List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Test.routeScreen);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetDate(),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Text(
                    '${Provider.of<TaskData>(context).tasks.length} Tasks - ${Provider.of<TaskData>(context).tasks.where((task) => task.isDone == true).length} done',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .clearTasksList();
                    Provider.of<TaskData>(context, listen: false)
                        .clearTasksForDate(date);
                  },
                  child: Text(
                    'clear all',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Provider.of<TaskData>(context).tasks.isEmpty
                    ? Center(
                        child: Text(
                        'No Tasks 🥳',
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ))
                    : TasksList(
                        date: date,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetDate extends StatefulWidget {
  const GetDate({super.key});

  @override
  State<GetDate> createState() => _GetDateState();
}

class _GetDateState extends State<GetDate> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: DateTime(1900),
          lastDate: DateTime(2200),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Color(0xFF26A69A), // <-- SEE HERE
                  onPrimary: Colors.white, // <-- SEE HERE
                  onSurface: Colors.black, // <-- SEE HERE
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: Colors.black, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );
        if (newDate == null) return;
        setState(() {
          dateTime = newDate;
          date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
        });
        Provider.of<TaskData>(context, listen: false).getTasksForDate(date);
      },
      child: Row(
        children: [
          Icon(
            Icons.calendar_month,
            color: Colors.white,
          ),
          SizedBox(width: 5),
          Text(
            date,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
