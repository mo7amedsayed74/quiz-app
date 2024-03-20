import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({super.key, required this.ans, required this.function});

  final String ans;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
          onPressed: function,
          child: Text(
            ans,
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
