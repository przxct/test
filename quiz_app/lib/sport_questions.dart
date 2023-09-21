import 'package:flutter/material.dart';

class Question {
  final String question;
  final List<String> choices;
  final String correctAnswer;

  Question({
    required this.question,
    required this.choices,
    required this.correctAnswer,
  });
}

class SportPage extends StatefulWidget {
  const SportPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SportPageState createState() => _SportPageState();
}

class _SportPageState extends State<SportPage> {
  int currentIndex = 0;
  int point = 0;
  List<Question> questions = [
    Question(
      question: 'In golf, what name is given to a hole score of two under par?',
      choices: ["Birdie","Bogey","Albatross","Eagle"],
      correctAnswer: "Eagle"
    ),
    Question(
      question: 'Which of these Russian cities did NOT contain a stadium that was used in the 2018 FIFA World Cup?',
      choices: ["Rostov-on-Don","Yekaterinburg","Kaliningrad","Vladivostok"],
      correctAnswer: "Vladivostok"
    ),
    // Add more questions here...
  ];

  void nextQuestion(String choice) {
    if (choice == questions[currentIndex].correctAnswer) {
      setState(() {
        point++;
        // print(choice);
      });
    }
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      // Reach the end of questions, show a completion message or navigate to another page.
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Quiz Completed'),
          content: Text('You have $point points!'),
          actions: [
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.push(context, MaterialPageRoute(builder:(context)=> const HomePage()));
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Questions',
      home: Scaffold(
        appBar: AppBar(title: const Text('Sports Questions')),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Question ${currentIndex+1}", 
                style: const TextStyle(fontSize: 18.0)
              ),
            ),
            const SizedBox(height: 50.0),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                questions[currentIndex].question,
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
            const SizedBox(height: 30.0),
            ...questions[currentIndex].choices.map((choice) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 320.0,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {nextQuestion(choice);},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 190, 192, 190),
                        ), 
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(choice, style: const TextStyle(color: Colors.black))
                            )
                          ],
                        ),
                      )
                    )
                  ]
                )
              );
            }),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {nextQuestion('a');},
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
