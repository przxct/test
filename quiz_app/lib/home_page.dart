import 'package:flutter/material.dart';
import 'history_questions.dart';
import 'sport_questions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select question type',
              style: TextStyle(fontSize: 36),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QuestionButton(text: 'Sports', icon: Icons.sports, page: SportPage()),
                QuestionButton(text: 'History', icon: Icons.history_edu, page: HistoryPage()),
              ]
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     QuestionButton(text: 'Geography', icon: Icons.language),
            //     QuestionButton(text: 'Books', icon: Icons.book),
            //   ]
            // ),
          ],
        ),
      ),
    );
  }
}

class QuestionButton extends StatelessWidget {

  const QuestionButton({super.key, required this.text, required this.icon, required this.page});
  final String text;
  final IconData icon;
  final dynamic page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 150.0,
            height: 80.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=> page));
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ), 
              child: Column( // Replace with a Row for horizontal icon + text
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(icon),
                  Text(text),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
