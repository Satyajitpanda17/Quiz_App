// lib/widgets/quiz_card.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/presentation/appscreens/quizscreen.dart';
class QuizCard extends StatelessWidget {
  final String title;
  final String description;
  final int duration; // Duration in minutes
  final String correctAnswerMarks;
  final String negativeMarks;
  //final VoidCallback onStartQuiz;
   QuizCard({
    Key? key,
    required this.title,
    required this.description,
    required this.duration,
    required this.correctAnswerMarks,
    required this.negativeMarks,
    //required this.onStartQuiz,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 4,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16,color: Colors.white,),
            ),
            SizedBox(height: 16),
            Text(
              'Duration: $duration minutes',
              style: TextStyle(fontSize: 16,color: Colors.white,),
            ),
            SizedBox(height: 8),
            Text(
              'Marking Scheme: +$correctAnswerMarks / -$negativeMarks',
              style: TextStyle(fontSize: 16,color: Colors.white,),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: (){
                Get.to(() => QuizScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: Text('Start Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
      ),
    );
  }
}