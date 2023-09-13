import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.screenChange, {super.key});
 final void Function() screenChange;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/logos/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(182, 255, 255, 255),
            ),
            const SizedBox(height: 100),
            const Text(
              'Learn Flutter The Fun Away!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              onPressed:
                screenChange
              ,
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                'Start Over',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ]),
    );
  }
}
