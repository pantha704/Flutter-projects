import 'dart:ffi';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'question.dart';
import 'quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:material_color_scheme/material_color_scheme.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      )
    );
  }
}


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];
  int score = 0;

  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<String> answers = ['false', 'true', 'true'];
  // Question q1 = Question( questionText : 'You can lead a cow down stairs but not up stairs.', questionAnswer: false );


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
                quizBrain.getQuestionText() as String,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              color: Colors.green,
              child: TextButton(
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  setState(() {
                        if (quizBrain.getAnswer() == true){
                          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                          score++;
                        } else {
                          scoreKeeper.add(Icon(Icons.close,color: Colors.red));
                        }
                  quizBrain.nextQuestion();
                        if (quizBrain.isFinished()){
                          Alert(
                            context: context,
                            title: 'Finished!',
                            desc: 'You\'ve reached the end of the quiz.\nYour score was $score/${scoreKeeper.length}.',
                          ).show();
                          quizBrain.reset();
                          scoreKeeper = [];
                          score = 0;
                        }
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              child: TextButton(
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  setState(() {
                    if (quizBrain.getAnswer() == false){
                      scoreKeeper.add(Icon(Icons.check,color: Colors.green));
                      score++;
                    } else {
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    quizBrain.nextQuestion();
                    if (quizBrain.isFinished()){
                      Alert(
                        context: context,
                        title: 'Finished!',
                        desc: 'You\'ve reached the end of the quiz.\nYour score was $score/${scoreKeeper.length}.',
                      ).show();
                      quizBrain.reset();
                      scoreKeeper = [];
                      score = 0;
                    }
                  });
                },
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/