import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

Quize_brain quizeBrain = new Quize_brain();
int totalCount = 0;

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Text("Quizer"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizePage(),
          ),
        ),
      ),
    );
  }
}

class QuizePage extends StatefulWidget {
  @override
  _QuizePageState createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool answerStatus, BuildContext context) {
    if (totalCount <= quizeBrain.list.length - 1) {
      bool correctAnswer = quizeBrain.getAnswer();
      setState(() {
        if (correctAnswer == answerStatus) {
          Alert(context: context, desc: "Correct.").show();
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          Alert(context: context, desc: "Fail.").show();
          scoreKeeper.add(Icon(Icons.cancel, color: Colors.red));
        }
      });

      quizeBrain.nextQuestion();
      totalCount++;
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizeBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            )),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text(
                    "True",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    checkAnswer(true, context);
                  },
                ))),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  textColor: Colors.green,
                  color: Colors.red,
                  child: Text(
                    "False",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    checkAnswer(true, context);
                  },
                ))),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
