// lib/screens/result_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/presentation/appscreens/homescreen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final  List<String> questionList;
  final List<String> selectedAnswers;
  final List<String> correctAnswers;
  final List<String> detailedSolutions;
  final List<String> readingMaterials;

  ResultScreen({
    required this.score,
    required this.questionList,
    required this.selectedAnswers,
    required this.correctAnswers,
    required this.detailedSolutions,
    required this.readingMaterials,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Quiz Result')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle
              ),
              child: Text('Your Score: $score', style: TextStyle(fontSize: 24,color: Colors.white))),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: selectedAnswers.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: (selectedAnswers[index]==correctAnswers[index]) ? Colors.green : Colors.red,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Question ${index + 1}', style: TextStyle(fontSize: 18)),
                          Text('${questionList[index]}', style: TextStyle(color: Colors.black),),
                          SizedBox(height: 10,),
                          Text('Your Answer: ${selectedAnswers[index]}', style: TextStyle(color: Colors.black)),
                          SizedBox(height: 10,),
                          Text('Correct Answer: ${correctAnswers[index]}', style: TextStyle(color: Colors.black)),
                          Row(
                            children: [
                              ElevatedButton(
                              onPressed: (){
                                //print('$detailedSolutions[index]');
                                  showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Detailed Solution'),
                                      content: Text('${detailedSolutions[index]}' ?? 'No solution available.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Close the dialog
                                          },
                                          child: Text('Close'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                              ),
                              child:  Text('Detailed Solution',
                              style:  TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),),
                              SizedBox(width: 30,),
                              ElevatedButton(
                              onPressed: (){
                                //print('$detailedSolutions[index]');
                                  showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Materials'),
                                      content: Text('${readingMaterials[index]}' ?? 'No solution available.'),
                                      actionsOverflowDirection: VerticalDirection.down,
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Close the dialog
                                          },
                                          child: Text('Close'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                              ),
                              child:  Text('Materials',
                              style:  TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),),
                            ],
                          ),
                         //Text('Practice Material: ${readingMaterials[index]}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Get.offAll(() => Homescreen());
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            child: Text('Return to Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),))
          ],
        ),
      ),
    );
  }
}