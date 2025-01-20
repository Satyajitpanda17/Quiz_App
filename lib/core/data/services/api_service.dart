// lib/services/api_service.dart
//import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/core/data/models/quiz.dart';

class ApiService {
  Future<QuizDataModel> fetchQuiz() async {
    print('hi how are you ?');
    try {
      final response = await http.get(Uri.parse('https://api.jsonserve.com/Uw5CrX'));
    if (response.statusCode == 200) {
      return quizDataModelFromJson(response.body.toString());
    } else {
      throw Exception('Failed to load quiz');
    }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load quiz');
    }
  }
}