import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:quiz_app/core/presentation/appscreens/quizscreen.dart';
import 'package:quiz_app/core/presentation/appscreens/startscreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight =  MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth,
            height: screenHeight/2,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/person1.jpg"),
              fit: BoxFit.fill,
          )
        )
    ),
        SizedBox(
          height: screenHeight*0.1,
        ),
        Container(
          width: screenWidth*0.85,
          child: ElevatedButton(
            onPressed: (){
              Get.to(() => StartQuizScreen());
            },
          style: ElevatedButton.styleFrom(
            backgroundColor:Colors.deepPurple,
          ), 
          child: Text('Start Quiz',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),),
        ),
        SizedBox(height: screenHeight*0.01,),
        Container(
          width: screenWidth*0.85,
          child: ElevatedButton(
            onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor:Colors.deepPurple,
          ), 
          child: Text('Learn More',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),),
        )
        ],
      ),
    );
  }
}