import 'package:cricquiz/models/category.dart';
import 'package:cricquiz/providers/QuizQuestionsProvider.dart';
import 'package:cricquiz/ui/pages/quiz_finished.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  final Category category;
  final String gameLevel;

  QuizPage({Key key, @required this.category, this.gameLevel})
      : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  TextEditingController _answerTextController = TextEditingController();
  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  int _currentIndex = 0;
  int _correctAnswer = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  

  @override
  Widget build(BuildContext context) {
    final quizQuestionsProvider = Provider.of<QuizQuestionsProvider>(context);
    if(quizQuestionsProvider.isLoading == true) quizQuestionsProvider.requestOnlineQuestions();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          key: _key,
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text(widget.category.name),
            elevation: 0,
            backgroundColor: Color(0xff27ae60),
          ),
          body: quizQuestionsProvider.isLoading
              ? Center(
                child: CircularProgressIndicator()
              )
              : Stack(
                  children: <Widget>[
                    ClipPath(
                      clipper: WaveClipperTwo(),
                      child: Container(
                        decoration: BoxDecoration(color: Color(0xff27ae60)),
                        height: 250,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.white70,
                                child: Text("${_currentIndex + 1}"),
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: Text(
                                  HtmlUnescape().convert(quizQuestionsProvider
                                      .offlineQuizQuestions[_currentIndex]
                                      .questionTitle), //widget.questions[_currentIndex].question),
                                  softWrap: true,
                                  style: _questionStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: _answerTextController,
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Answer Here",
                                      border: InputBorder.none,
                                    ),
                                    textAlign: TextAlign.center,
                                    showCursor: false,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          widget.category.id == 2
                              ? Container(
                                  width: MediaQuery.of(context).size.width - 40,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.00)),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        quizQuestionsProvider
                                            .offlineQuizQuestions[_currentIndex]
                                            .questionPhoto
                                            .url, //"https://resources.pulse.icc-cricket.com/photo-resources/2019/07/07/bee07313-fb1f-4b29-b033-f761bb52d1d1/Shakib.jpg?width=845&height=476"),
                                      ),
                                    ),
                                  ))
                              : SizedBox(
                                  height: 0,
                                ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: RaisedButton(
                                child: Text(_currentIndex ==
                                        (quizQuestionsProvider
                                                .offlineQuizQuestions.length -
                                            1)
                                    ? "Submit"
                                    : "Next"),
                                onPressed: () {
                                  if (_answerTextController.text == "") {
                                    _key.currentState.showSnackBar(SnackBar(
                                      content: Text(
                                          "You must enter an answer to continue."),
                                    ));
                                   
                                  }
                                  else if (_currentIndex <
                                      (quizQuestionsProvider
                                              .offlineQuizQuestions.length -
                                          1)) {
                                    

                                    if (_answerTextController.text.toUpperCase() ==  quizQuestionsProvider.offlineQuizQuestions[_currentIndex].questionAnswer.toUpperCase()){
                                      _correctAnswer++;
                                      print(_correctAnswer);
                                    } else {
                                      print(_answerTextController.text.toUpperCase());
                                      print(quizQuestionsProvider.offlineQuizQuestions[_currentIndex].questionAnswer.toUpperCase());
                                      print("Answer Not Detected");
                                      print(_answerTextController.text.toUpperCase() ==  quizQuestionsProvider.offlineQuizQuestions[_currentIndex].questionAnswer.toUpperCase());
                                    }
                                    setState(() {
                                      _currentIndex++;
                                      
                                    });
                                    _answerTextController.text = "";
                                  } else {
                                    if (_answerTextController.text.toUpperCase() ==  quizQuestionsProvider.offlineQuizQuestions[_currentIndex].questionAnswer.toUpperCase()){
                                      _correctAnswer++;
                                      print(_correctAnswer);
                                    } else {
                                      print(_answerTextController.text.toUpperCase());
                                      print(quizQuestionsProvider.offlineQuizQuestions[_currentIndex].questionAnswer.toUpperCase());
                                      print("Answer Not Detected");
                                      print(_answerTextController.text.toUpperCase() ==  quizQuestionsProvider.offlineQuizQuestions[_currentIndex].questionAnswer.toUpperCase());
                                    }
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (_) => QuizFinishedPage(
                                                  totalQuestions:
                                                      quizQuestionsProvider
                                                          .offlineQuizQuestions
                                                          .length,
                                                  totalCorrectAnswer: _correctAnswer,
                                                )));
                                  }
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
    );
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Are you sure you want to quit the quiz? All your progress will be lost."),
            title: Text("Warning!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
  }
}
