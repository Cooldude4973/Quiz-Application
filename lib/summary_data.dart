import 'package:flutter/material.dart';

class SummaryResult extends StatelessWidget {
  SummaryResult(this.myResultSummary, {super.key});
  List<Map<String, Object>> myResultSummary = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: myResultSummary.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    // backgroundColor: Color.fromARGB(255, 17, 0, 93)
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'].toString(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${data['user_answer']}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.pinkAccent),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data['correct_answer']}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.greenAccent,
                            backgroundColor: Colors.white10),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
