// ignore_for_file: prefer_initializing_formals

class Question {
  String text = "";
  String image = "";
  bool answer = false;

  Question({String t = "", String i = "", bool a = false}) {
    text = t;
    image = i;
    answer = a;
  }
}
