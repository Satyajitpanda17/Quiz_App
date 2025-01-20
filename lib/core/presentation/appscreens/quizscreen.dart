// lib/screens/quiz_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/presentation/appscreens/resultscreen.dart';
import '../controllers/quiz_controller.dart';
import 'package:html/parser.dart' as html_parser;

class QuizScreen extends StatelessWidget {
  final QuizController quizController = Get.put(QuizController());
  List<String?> questionList = []; 
  final List<String?> selectedAnswers = [];
  List<String?> correctAnswers = []; 
  List<String?> detailedSolutions= [];
  List<String?> readingMaterials = [];
  int score = 0;
   String convertHtmlToPlainText(String htmlString) {
    final document = html_parser.parse(htmlString);
    return document.body?.text ?? ''; // Extract text from the body
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Quiz: ${quizController.quiz.value.title}')),
      body: Obx(() {
        if (quizController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: quizController.quiz.value.questions.length,
            itemBuilder: (context, index) {
              final question = quizController.quiz.value.questions[index];
              if (selectedAnswers.length < quizController.quiz.value.questions.length) {
                questionList.add(null);
                selectedAnswers.add(null);
                correctAnswers.add(null);
                detailedSolutions.add(null);
                readingMaterials.add(null); 
              }
              questionList[index]=question.description;
              detailedSolutions[index]= question.detailedSolution;
                 if (question.readingMaterial != null && question.readingMaterial.contentSections != null) {
                readingMaterials[index] = question.readingMaterial.contentSections
                    .map((htmlString) => convertHtmlToPlainText(htmlString))
                    .join('\n');
              } else {
                readingMaterials[index] = 'No reading material available';
              }
              return Card(
                margin: EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(question.description, style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      ...question.options.map((option) {
                        if (option.isCorrect) {
                          correctAnswers[index]=option.description;
                        }
                        return RadioListTile(
                          title: Text(option.description),
                          value: option.isCorrect,
                          groupValue: selectedAnswers[index],
                          activeColor: Colors.black,
                          onChanged: (value) {
                            selectedAnswers[index] = option.description;
                            // Update the score
                            if (value == true) {
                              score += 4; // Correct answer
                            } else {
                              score -= 1; // Wrong answer
                            }
                          },
                        );
                      }).toList(),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(readingMaterials.length);
          for(var i in readingMaterials){
            print(i);
          }
          // Navigate to the result screen and pass the score
          Get.to(() => ResultScreen(score: score,
          questionList: questionList.map((q) => q.toString()).toList(),
  selectedAnswers: selectedAnswers.map((answer) => answer.toString()).toList(),
  correctAnswers: correctAnswers.map((answer) => answer.toString()).toList(),
  detailedSolutions: detailedSolutions.map((answer) => answer.toString()).toList(),
  readingMaterials: readingMaterials.map((answer) => answer.toString()).toList(),
  )
  );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}