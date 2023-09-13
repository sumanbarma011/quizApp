import 'package:adv_quiz/models/questions.dart';
import 'package:adv_quiz/question_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.scrrenChangeToQuestion,
      required this.choosenStrings});
  final List<String> choosenStrings;
  final void Function() scrrenChangeToQuestion;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < choosenStrings.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct_ans': questions[i].answer[0],
        'user_ans': choosenStrings[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final summaryData = getSummaryData();
    final correctedAns = summaryData.where((data) {
      return data['user_ans'] == data['correct_ans'];
    }).length;
    // };

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      // color: Colors.red,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'You corrected $correctedAns out of $totalQuestions answers !',
              style: const TextStyle(
                letterSpacing: 1,
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionSummary(summaryData: getSummaryData()),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: scrrenChangeToQuestion,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Restart Quiz',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
