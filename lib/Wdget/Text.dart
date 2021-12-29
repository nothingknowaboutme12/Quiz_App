import 'package:flutter/material.dart';
class Question extends StatelessWidget {
Question({required this.questions});
final Object questions;
  @override
  Widget build(BuildContext context) {
    return Text(
      questions as String, style: TextStyle(
      fontSize: 23,
    ),
      textAlign: TextAlign.center,

    );
  }
}
