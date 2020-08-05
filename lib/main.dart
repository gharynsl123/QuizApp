import 'package:aplikasi_quiz/question_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

QuestionLogic questionLogic = QuestionLogic();

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Quiz",
                style: TextStyle(color: Colors.green),
              ),
              Text("App")
            ],
          ),
        ),
        backgroundColor: Color(0xff430e48),
        //untuk membuat sebuah tampinlan bodynya kita menggunakan class lain dan kita panggi di class pertama
        body: QuizScreen(),
      ),
    );
  }
}

//ini adalah class lainnya
class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Widget> scoreResult = [
    Text(
      "Hasil : ",
      style: TextStyle(color: Colors.white),
    )
  ];

  void checkAnswer(bool answer) {
    bool correctAnswer = questionLogic.getCorrectAnswer();

    setState(() {
      if (questionLogic.isFinished()) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Alhamdulillah Selesai",
          desc: "Main Ulang Quiz.",
          buttons: [
            DialogButton(
              child: Text(
                "finish",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        questionLogic.resetQuestion();
        scoreResult.clear();
      }else{
        if(answer == correctAnswer) {
          scoreResult.add(Icon(Icons.close, color: Colors.red,));
        }

        questionLogic.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: scoreResult,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey),
              child: Text(
                questionLogic.getQuestionNumberText().toString() +
                    "/" +
                    questionLogic.getTotalQuestionText().toString(),
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionLogic.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.red)),
                  color: Colors.red,
                  child: Text(
                    "SALAH",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.green)),
                  color: Colors.green,
                  child: Text(
                    "BENAR",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
