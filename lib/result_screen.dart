import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/summary_data.dart';
// import 'package:adv_basics/Quiz.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(this.useranswers, this.restartQuiz, {super.key});

  final void Function() restartQuiz;

  List<String> useranswers = [];

  List<Map<String, Object>> summary = [];

  List<Map<String, Object>> getSummary() {
    for (var i = 0; i < useranswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': useranswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final mySummary = getSummary();
    int numberOfQuestions = questions.length;
    int numberOfCorrectAnswers = summary.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $numberOfCorrectAnswers questions correct out of $numberOfQuestions questions',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SummaryResult(mySummary),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: restartQuiz,
                icon: const Icon(Icons.restart_alt_sharp),
                label: const Text('Restart Quiz'),
                style: TextButton.styleFrom(foregroundColor: Colors.white))
          ],
        ),
      ),
    );
  }
}
