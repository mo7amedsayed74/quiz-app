import 'package:flutter/cupertino.dart';

class Question extends StatelessWidget {
  const Question({super.key, required this.question, required this.color});

  final String question;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 30),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(14),
        child: Text(
          question,
          style: TextStyle(fontSize: 25, color: color),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
