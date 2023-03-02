import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizBrain.dart';

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(child: QuizApp()),
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];
  bool correctAnswer = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: MaterialButton(
              child: Text(
                "True",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (questionNumber >= quizBrain.questionBank.length - 1) {
                  Alert(
                          context: context,
                          title: "Completed",
                          desc: "You have completed the Quiz")
                      .show();
                  scoreKeeper.removeRange(0, quizBrain.questionBank.length - 1);
                  questionNumber = 0;
                } else {
                  correctAnswer = quizBrain.getAnswer();
                  if (correctAnswer == true) {
                    //print("user made it right");
                    setState(() {
                      quizBrain.nextQuestion();

                      //questionNumber++;
                      scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    });
                  } else {
                    setState(() {
                      //print('User made it wrong');
                      quizBrain.nextQuestion();
                      scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    });
                  }
                }
              },
              color: Colors.green,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: MaterialButton(
              child: Text(
                "False",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (questionNumber >= quizBrain.questionBank.length - 1) {
                  questionNumber = 0;
                  quizBrain.nextQuestion();

                  Alert(
                          context: context,
                          title: "Completed",
                          desc: "You have completed the Quiz")
                      .show();
                  scoreKeeper.removeRange(0, quizBrain.questionBank.length - 1);
                } else {
                  correctAnswer = quizBrain.getAnswer();
                  if (correctAnswer == false) {
                    quizBrain.nextQuestion();
                    setState(() {
                      //questionNumber++;
                      scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    });
                  } else
                    setState(() {
                      //print('User made it wrong');
                      quizBrain.nextQuestion();
                      scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    });
                }
              },
              color: Colors.red,
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
