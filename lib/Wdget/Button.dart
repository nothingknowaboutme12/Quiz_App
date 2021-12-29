import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  Button({required this.onpressed,required this.ButtonValue});
  String ButtonValue;
 final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onpressed,
      child: Text(ButtonValue),
    );
  }
}
