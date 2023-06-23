import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton(this.answerVal, this.onTap, {super.key});

  String answerVal;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          // fixedSize: const Size.fromWidth(),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          textStyle: const TextStyle(
            color: Colors.white,
          ),
          backgroundColor: Colors.deepPurple.shade900,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Text(
        answerVal,
        textAlign: TextAlign.center,
      ),
    );
  }
}
