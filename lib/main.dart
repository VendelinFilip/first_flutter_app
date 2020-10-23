import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//void main() {
//  runApp(MyApp());
//}
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What phone do you use?',
      'answers': [
        {'text': 'an iPhone', 'score': 20},
        {'text': 'a Google pixel phone', 'score': 30},
        {'text': 'a Samsung', 'score': 10},
      ]
    },
    {
      'questionText': 'What\'s your favorite car brand?',
      'answers': [
        {'text': 'a Tesla', 'score': 30},
        {'text': 'a Ford', 'score': 10},
        {'text': 'a Ferrari', 'score': 20},
      ]
    },
    {
      'questionText': 'What\'s your favorite book?',
      'answers': [
        {'text': 'Harry Potter and the Philosopher\'s Stone', 'score': 10},
        {'text': 'The Book Thief', 'score': 20},
        {'text': 'Alchemist by Paulo Coelho', 'score': 30},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions.');
    } else {
      print('No more questions.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Flutter App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
