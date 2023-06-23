import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;
  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var questionIndex = 0;

  void updateQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 40,
            ),
            // ElevatedButton(onPressed: () {}, child: Text('Answer 1')),
            // ElevatedButton(onPressed: () {}, child: Text('Answer 2')),
            // ElevatedButton(onPressed: () {}, child: Text('Answer 3')),
            // ElevatedButton(onPressed: () {}, child: Text('Answer 4')),
            // AnswerButton('uisdfj', () {}),
            // AnswerButton('uisdfj', () {}),
            // AnswerButton('uisdfj', () {}),
            // AnswerButton('uisdfj', () {}),
            ...currentQuestion.shufflingList().map((answer) {
              return Container(
                margin: const EdgeInsets.all(4),
                child: AnswerButton(answer, () {
                  updateQuestion(answer);
                }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
