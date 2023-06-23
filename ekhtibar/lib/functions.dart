import 'questions.dart';
import 'package:audioplayers/audioplayers.dart';

class Functions {
  int _numOfQuestion = 0;
  final List<Question> _q = [];

  Functions() {
    _q.add(Question(
        t: "عدد الكواكب في المجموعة الشمسية هو ثمانية الكواكب",
        i: "images/image-1.jpg",
        a: true));
    _q.add(Question(
        t: "القطط هي حيوانات لاحمة", i: "images/image-2.jpg", a: true));
    _q.add(Question(
        t: "الصين موجودة في القارة الإفريقية",
        i: "images/image-3.jpg",
        a: false));
    _q.add(Question(
        t: "الأرض مسطحة وليست كروية", i: "images/image-4.jpg", a: false));
    _q.add(Question(
        t: "بإستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم",
        i: "images/image-5.jpg",
        a: true));
    _q.add(Question(
        t: "الشمس تدور حول الأرض والأرض تدول حول القمر",
        i: "images/image-6.jpg",
        a: false));
    _q.add(Question(
        t: "الحيوانات لا تشعر بالألم", i: "images/image-7.jpg", a: false));
  }

  void nextQuestion() {
    _numOfQuestion++;
  }

  bool previousQuestion() {
    if (_numOfQuestion >= 1) {
      _numOfQuestion--;
      return true;
    } else {
      return false;
    }
  }

  bool isFinished() {
    if (_numOfQuestion >= _q.length) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _numOfQuestion = 0;
  }

  int getNumOfQuestion() {
    return _numOfQuestion;
  }

  int getLengthOfQuestions() {
    return _q.length;
  }

  // sounds
  void sound(String path) {
    final player = AudioPlayer();
    player.play(UrlSource(path));
  }

  // get methods

  String getText() {
    return _q[_numOfQuestion].text;
  }

  String getImage() {
    return _q[_numOfQuestion].image;
  }

  bool getAnswer() {
    return _q[_numOfQuestion].answer;
  }
}
