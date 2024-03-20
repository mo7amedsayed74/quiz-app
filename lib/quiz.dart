import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:quize_app/questions.dart';
import 'answer.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int questionIndex = 0;
  int totalScore = 0;
  bool onDarkMode = false;
  List<Map<String, dynamic>> question = [
    {
      'id': "What’s your favorite programming language?",
      'answer': [
        {'text': 'Flutter', 'score': 10},
        {'text': 'C++', 'score': 0},
        {'text': 'Python', 'score': 0},
        {'text': 'Java', 'score': 0}
      ]
    },
    {
      'id': "What’s your favorite animal?",
      'answer': [
        {'text': 'cat', 'score': 10},
        {'text': 'dog', 'score': 0},
        {'text': 'caw', 'score': 0},
        {'text': 'bird', 'score': 0}
      ]
    },
  ];

  void x(int score) {
    totalScore += score;
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Quiz app",
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: onDarkMode,
            onChanged: (value) {
              setState(() {
                onDarkMode = value;
              });
            },
            inactiveThumbColor: Colors.black,
            activeColor: Colors.white,
            thumbIcon:
                MaterialStateProperty.all(const Icon(Icons.dark_mode_outlined)),
          )
        ],
      ),
      body: ConditionalBuilder(
        condition: questionIndex < question.length,
        builder: (context){
          return Container(
            color: onDarkMode ? Colors.black : Colors.white,
            child: Column(
              children: [
                Question(
                  question: question[questionIndex]['id'],
                  color: onDarkMode ? Colors.white : Colors.black,
                ),
                ...(question[questionIndex]['answer']
                as List<Map<String, dynamic>>)
                    .map(
                      (e) => Answer(
                    function: () => x(int.parse(e['score'].toString())),
                    ans: e['text'],
                  ),
                )
                    .toList(),
              ],
            ),
          );
        },
        fallback: (context){
          return Container(
            width: double.infinity,
            color: onDarkMode ? Colors.black : Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "GOOD JOB !",
                  style: TextStyle(
                    fontSize: 40,
                    color: onDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Your score is $totalScore",
                  style: TextStyle(
                    fontSize: 25,
                    color: onDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      questionIndex = 0;
                      totalScore = 0;
                    });
                  },
                  child: const Text(
                    "Try Again",
                    style: TextStyle(fontSize: 25, color: Colors.teal),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
