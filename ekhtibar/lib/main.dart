// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'functions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Functions functions = Functions();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("اختبار"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Exam(),
        ),
      ),
    );
  }
}

class Exam extends StatefulWidget {
  const Exam({super.key});

  @override
  State<Exam> createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  int mark = 0;
  bool correctAnswer = false;
  List<Padding> userAnswers = [];
  List<bool> userPicked = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyOfApp;

    // question body
    if (functions.isFinished() == false) {
      bodyOfApp = [
        // row of answers and icons
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: userAnswers,
              ),
              Text(
                "اجاباتك",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        // Container of image and text of  question
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Image.asset(functions.getImage()),
              const SizedBox(height: 20),
              Text(
                functions.getText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        // true button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text(
                "صح",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                checkAnswer(true);
                if (functions.getNumOfQuestion() ==
                    functions.getLengthOfQuestions()) {
                  functions.sound("sounds/win.wav");
                } else {
                  functions.sound("sounds/click.wav");
                }
              },
            ),
          ),
        ),
        // false button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text(
                "خطأ",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                checkAnswer(false);
                if (functions.getNumOfQuestion() ==
                    functions.getLengthOfQuestions()) {
                  functions.sound("sounds/win.wav");
                } else {
                  functions.sound("sounds/click.wav");
                }
              },
            ),
          ),
        ),
        // row of question number and go to back question
        Expanded(
          flex: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    if (functions.previousQuestion() == true) {
                      if (userPicked.removeLast() == functions.getAnswer()) {
                        mark--;
                      }
                      userAnswers.removeLast();
                      functions.sound("sounds/click.wav");
                    }
                  });
                },
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
              Text(
                "السؤال ${functions.getNumOfQuestion() + 1}",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ];
    }
    // result body
    else {
      bodyOfApp = [
        Padding(
          padding: const EdgeInsets.all(20),
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.green,
            child: Icon(
              size: 100,
              Icons.done_all_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          "لقد اجبت على كل الاسئلة",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: 50,
          child: TextButton(
            onPressed: () {
              setState(() {
                alert();
                functions.sound("sounds/click.wav");
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            child: Text(
              "اظهار النتيجة",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ];
    }

    // body of app
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: bodyOfApp,
    );
  }

  void checkAnswer(bool whatUserPicked) {
    correctAnswer = functions.getAnswer();
    setState(
      () {
        if (functions.isFinished() == false) {
          if (whatUserPicked == correctAnswer) {
            mark++;
            userAnswers.add(correctIcon());
            userPicked.add(whatUserPicked);
          } else {
            userAnswers.add(wrongIcon());
            userPicked.add(whatUserPicked);
          }
          functions.nextQuestion();
        }
      },
    );
  }

  // popup window
  void alert() {
    Alert(
      context: context,
      type: AlertType.success,
      desc: "درجتك هي $mark من ${functions.getLengthOfQuestions()}",
      buttons: [
        DialogButton(
          onPressed: () {
            setState(() {
              functions.reset();
              userAnswers.clear();
              userPicked.clear();
              mark = 0;
              functions.sound("sounds/reset.wav");
            });
          },
          width: 120,
          child: Text(
            "إعادة الاختبار",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  // Icons: correct, wrong
  Padding correctIcon() {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  }

  Padding wrongIcon() {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }
}
