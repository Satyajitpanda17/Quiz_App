// lib/controllers/quiz_controller.dart
import 'package:get/get.dart';
import 'package:quiz_app/core/data/models/quiz.dart';
import 'package:quiz_app/core/data/services/api_service.dart';


class QuizController extends GetxController {
  var quiz = QuizDataModel(
    id: 0,
    name: null,
    title: '',
    description: '',
    difficultyLevel: null,
    topic: '',
    time: DateTime.now(),
    isPublished: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    duration: 0,
    endTime: DateTime.now(),
    negativeMarks: '',
    correctAnswerMarks: '',
    shuffle: false,
    showAnswers: false,
    lockSolutions: false,
    isForm: false,
    showMasteryOption: false,
    readingMaterial: null,
    quizType: null,
    isCustom: false,
    bannerId: null,
    examId: null,
    showUnanswered: false,
    endsAt: DateTime.now(),
    lives: null,
    liveCount: '',
    coinCount: 0,
    questionsCount: 0,
    dailyDate: '',
    maxMistakeCount: 0,
    readingMaterials: [],
    questions: [],
    progress: 0,
  ).obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    fetchQuiz();
    super.onInit();
  }

  void fetchQuiz() async {
    try {
      isLoading(true);
      var fetchedQuiz = await ApiService().fetchQuiz();
      quiz.value = fetchedQuiz;
    } finally {
      isLoading(false);
    }
  }
}