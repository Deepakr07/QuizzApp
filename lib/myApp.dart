import 'package:flutter/material.dart';
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
  // List<String> question = [
  //   'Is Delhi the capital of India?',
  //   'Is Tesla Owned by Ambani?',
  //   'Indi is qualified for Qatar world cup'
  // ];
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];
  int questionNumber = 0, scoreCount = 0;
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
                quizBrain.questionBank[questionNumber].questionText,
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
                correctAnswer =
                    quizBrain.questionBank[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  //print("user made it right");
                  setState(() {
                    questionNumber >= 12
                        ? questionNumber = 0
                        : questionNumber++;
                    //questionNumber++;
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                } else
                  setState(() {
                    //print('User made it wrong');
                    questionNumber >= 12
                        ? questionNumber = 0
                        : questionNumber++;
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  });
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
                correctAnswer =
                    quizBrain.questionBank[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  //print("user made it right");
                  setState(() {
                    questionNumber >= 12
                        ? questionNumber = 0
                        : questionNumber++;
                    //questionNumber++;
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                } else
                  setState(() {
                    //print('User made it wrong');
                    questionNumber >= 12
                        ? questionNumber = 0
                        : questionNumber++;
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  });
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
