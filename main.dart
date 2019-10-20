import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

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
      'questionText': 'correct the order of evaluation ?'
         'z = x + y * z / 4 % 2 - 1' ,
      'answers': [
        {'text': '* / % + - =', 'score': 1},
        {'text': '= * / % + -', 'score': 0},
        {'text': '/ * % - + =', 'score': 0},
        {'text': '* % / - + =', 'score': 0},
      ],
    },
    {
      'questionText': 'the correct usage of conditional operators used in C?',
      'answers': [
        {'text': 'a>b ? c=30 : c=40;', 'score': 0},
        {'text': 'a>b ? c=30;', 'score': 0},
        {'text': 'max = a>b ? a>c?a:c:b>c?b:c', 'score': 1},
        {'text': 'return (a>b)?(a:b)', 'score': 0},
      ],
    },
    {
      'questionText': 'correct order if calling functions in the below code?'
      'a = f1(23, 14) * f2(12/4) + f3();'

      ,
      'answers': [
        {'text': 'f1, f2, f3', 'score': 0},
        {'text': 'Order may vary from compiler to compiler', 'score': 1},
        {'text': 'f3, f2, f1', 'score': 0},
        {'text': 'None of above', 'score': 0},
      ],
    },
    {
      'questionText': 'correctly shows the hierarchy of arithmetic operations in C?'
      ,
      'answers': [
        {'text': '/ + * -', 'score': 0},
        {'text': '* - / +', 'score': 0},
        {'text': '+ - / *', 'score': 0},
        {'text': '/ * + -', 'score': 1},
      ],
    },
    {
      'questionText': "The expression of the right hand side of || operators doesn't "
          "get evaluated if the left hand side determines the outcome."
      ,
      'answers': [
        {'text': 'true', 'score': 1},
        {'text': 'false', 'score': 0},
      ],
    },
    {
      'questionText': "In the expression a=b=5 the order of Assignment is NOT decided by Associativity of operators"
      ,
      'answers': [
        {'text': 'true', 'score': 0},
        {'text': 'false', 'score': 1},
      ],
    },
    {
      'questionText': "The standard header _______ is used for variable list arguments (…) in C."
      ,
      'answers': [
        {'text': '<stdio.h >', 'score': 0},
        {'text': '<stdlib.h>', 'score': 0},
        {'text': '<math.h>', 'score': 0},
        {'text': ' <stdarg.h>', 'score': 1},
      ],
    },
    {
      'questionText': "What is the purpose of va_end?"
      ,
      'answers': [
        {'text': 'Cleanup is necessary', 'score': 0},
        {'text': 'Must be called before the program returns', 'score': 0},
        {'text': 'Cleanup is necessary & Must be called before the program returns', 'score': 1},
        {'text': ' None of the mentioned', 'score': 0},
      ],
    },
    {
      'questionText': "Which types of input are accepted in toupper(c)?"
      ,
      'answers': [
        {'text': 'char', 'score': 1},
        {'text': 'char*', 'score': 0},
        {'text': 'float', 'score': 0},
        {'text': 'Both char and char *', 'score': 0},
      ],
    },
    {
      'questionText': "What is the difference in the ASCII value of capital and non-capital of the same letter is?"
      ,
      'answers': [
        {'text': '1', 'score': 0},
        {'text': '16', 'score': 0},
        {'text': '32', 'score': 1},
        {'text': 'Depends on compiler', 'score': 0},
      ],
    },
    {
      'questionText': "What is function srand(unsigned)?",
      'answers': [
        {'text': 'Sets the seed for rand', 'score': 1},
        {'text': 'Doesn’t exist', 'score': 0},
        {'text': 'Is an error', 'score': 0},
        {'text': 'None of the mentioned', 'score': 0},
      ],
    },
    {
      'questionText': "Which is the best way to generate numbers between 0 to 99?",
      'answers': [
        {'text': 'rand()-100', 'score': 0},
        {'text': 'rand()%100', 'score': 1},
        {'text': ' rand(100)', 'score': 0},
        {'text': 'srand(100)', 'score': 0},
      ],
    },
    {
      'questionText': "Which is the correct way to generate numbers between minimum and maximum(inclusive)?",
      'answers': [
        {'text': 'minimum + (rand() % (maximum – minimum));', 'score': 0},
        {'text': 'minimum + (rand() % (maximum – minimum + 1));', 'score': 1},
        {'text': 'minimum * (rand() % (maximum – minimum))', 'score': 0},
        {'text': 'minimum – (rand() % (maximum + minimum));', 'score': 0},
      ],
    },
    {
      'questionText': "rand() and srand() functions are used _____________",
      'answers': [
        {'text': 'To find sqrt', 'score': 0},
        {'text': 'For and operations', 'score': 0},
        {'text': 'For or operations', 'score': 0},
        {'text': 'To generate random numbers', 'score': 1},
      ],
    },
    {
      'questionText': "What is the return type of rand() function?",
      'answers': [
        {'text': 'short', 'score': 0},
        {'text': 'int', 'score': 1},
        {'text': 'long', 'score': 0},
        {'text': 'double', 'score': 0},
      ],
    },
    {
      'questionText': "Which of the following can be used for random number generation?",
      'answers': [
        {'text': 'random()', 'score': 1},
        {'text': 'rnd()', 'score': 0},
        {'text': 'rndm()', 'score': 0},
        {'text': 'none of the above', 'score': 0},
      ],
    },

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
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('QUIZ APP:::"TEST YOUR BRAIN"'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
