import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: summaryData
              .map((data) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: (data['user_ans']) as String ==
                                (data['correct_ans']) as String
                            ? Colors.blue
                            :const Color.fromARGB(255, 224, 99, 141),
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['questions'] as String,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                            ),
                            Text(
                              data['user_ans'] as String,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 152, 104, 235),
                                  fontSize: 12),
                            ),
                            Text(
                              data['correct_ans'] as String,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 74, 132, 179),
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
