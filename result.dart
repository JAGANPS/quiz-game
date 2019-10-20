import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  final String iop = "Developed By Jagan .ps";
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 1 && resultScore<=3) {
      resultText = 'You are awesome and innocent! YOUR Score is 3';
    } else if (resultScore >=4 && resultScore<=6) {
      resultText = 'Pretty likeable! YOUR Score is  5';
    } else if (resultScore >= 6 && resultScore<=8) {
      resultText = 'Lots of improvement needed!!!! YOUR Score is  7';
    }
    else if (resultScore >= 9 && resultScore<=12) {
      resultText = 'GOOD TRY ! YOUR Score is  10';
    }
    else if (resultScore >= 12 && resultScore<=14) {
      resultText = 'Almost you reached IT! YOUR Score is  13';
    }
    else if (resultScore >= 15 && resultScore<=16) {
      resultText = 'You got out of out and   techie :) ! YOUR Score is  16';
    }
    else {
      resultText = 'Your unlcky day :((!YOUR Score is  0';

    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.deepOrange,
            onPressed: resetHandler,

          ),
        ],
      ),
    );
  }
}
