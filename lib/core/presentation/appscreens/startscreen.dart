import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/presentation/controllers/quiz_controller.dart';
import 'package:quiz_app/core/presentation/widgets/quiz_card.dart';

class StartQuizScreen extends StatelessWidget {
  StartQuizScreen({super.key});
final QuizController quizController = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 4,
      child: Obx(() {
        if(quizController.quiz.value == null){
           return Center(child: CircularProgressIndicator());
        }
        return QuizCard(
          title: quizController.quiz.value.title, 
          description: quizController.quiz.value.topic,
          duration: quizController.quiz.value.duration,
          correctAnswerMarks: quizController.quiz.value.correctAnswerMarks,
          negativeMarks: quizController.quiz.value.negativeMarks);
      }
      ),
    ); 
  }
}