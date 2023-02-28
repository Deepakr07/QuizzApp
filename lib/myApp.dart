import 'package:flutter/material.dart';

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
  List<String> question = [
    'Is Delhi the capital of India?',
    'Is Tesla Owned by Ambani?',
    'Indi is qualified for Qatar world cup'
  ];
  List<Icon> scoreKeeper = [
    Icon(Icons.check, color: Colors.green),
    Icon(
      Icons.close,
      color: Colors.red,
    )
  ];
  int colorCount = 0, scoreCount = 0;
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
                question[colorCount],
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
                setState(() {
                  if (colorCount == 2) {
                    colorCount = 0;
                  } else {
                    colorCount++;
                  }
                  scoreCount = 1;
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
                setState(() {
                  if (colorCount == 2) {
                    colorCount = 0;
                  } else {
                    colorCount++;
                  }
                  scoreCount = 1;
                });
              },
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
