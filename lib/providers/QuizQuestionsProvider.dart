import 'dart:convert';

import 'package:cricquiz/models/quiz_questions.dart';
import 'package:cricquiz/requests/QuizQuestionsRequest.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizQuestionsProvider with ChangeNotifier {
  List<Datum> _quizQuestionsList;
  bool _isLoading = true;

  List<Datum> get offlineQuizQuestions => _quizQuestionsList;
  bool get isLoading => _isLoading;

  Future<bool> requestOnlineQuestions() async {
    QuizQuestionRequest().requestQuizQuestions().then((data) async {
      if (data.statusCode == 200) {
        
        print("Q-Provider: Data Comes----> 200");
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.clear();
        var isStored = await sharedPreferences.setString(
            "questonsJsonEncoded", jsonEncode(data.body));
        isStored
            ? print("All questions is stored in SP successfully")
            : print("Not stored. Please Check Line 25 -> QUIZ PROVIDER");
        
        setLoading(false);    
      }
      getOfflineQuestions();
    });

    // bool isLoadedOnlineData = await requestQuizQuestions();
    // print("is Loaded data----->" + isLoadedOnlineData.toString());
    // isLoadedOnlineData? print("Data arrived from database"):print("Data is not arrived!!");
    //setLoading(false);

    //return isLoadedOnlineData;
    return true;
  }

  Future<List<Datum>> getOfflineQuestions() async {
    var questionsJsonEncoded = await _getValueFromSP("questonsJsonEncoded");
    print(questionsJsonEncoded);
    final QuizQuestions allQuestions =
        quizQuestionsFromJson(jsonDecode(questionsJsonEncoded));
    print("Line-------------------->> 44");
    List<Datum> questionsList = allQuestions.data;
    print(questionsList[0].questionTitle);
    //List<Datum> finalQuestionsList;
    // for (var question in questionsList) {
    //   question.id == categoryId && question.questionLevel == gameLevel ? finalQuestionsList.add(question): print("Category or Level not Matched!!!!!!!!");
    // }
    _quizQuestionsList = questionsList;

    return _quizQuestionsList;
  }

  void setLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  _getValueFromSP(var key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var value = sharedPreferences.getString(key);
    print("SP data------------>>>" + value);
    
    return value;
  }
}
