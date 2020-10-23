import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 30) {
      resultText = 'Your opinions suck.';
    } else if (resultScore <= 60) {
      resultText = 'You are an ok person.';
    } else if (resultScore <= 90) {
      resultText = 'Like actually how are we not best bros yet?';
    } else {
      resultText = 'Error';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetQuiz,
            child: Text('Restart quiz!'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
