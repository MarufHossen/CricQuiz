import 'package:cricquiz/models/category.dart';
import 'package:cricquiz/ui/pages/quiz_finished.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape.dart';

class Question {
  String question;
  String answer;

  Question({this.question, this.answer});

  Question.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}

class QuizPage extends StatefulWidget {
  final List<Question> questions = [
    Question(
        question: "What is the name of the player shown below?",
        answer: "Dhaka")
  ];
  final Category category;

  QuizPage({Key key, @required this.category}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  TextEditingController _answerTextController = TextEditingController();
  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //Question question = widget.questions[_currentIndex];
    //final List<dynamic> options = question.incorrectAnswers;
    // if(!options.contains(question.correctAnswer)) {
    //   options.add(question.correctAnswer);
    //   options.shuffle();
    // }

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
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration:
                    BoxDecoration(color: Color(0xff27ae60)),
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
                          HtmlUnescape().convert(
                              widget.questions[_currentIndex].question),
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
                            textCapitalization: TextCapitalization.characters,
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
                  SizedBox(height: 10,),
                  widget.category.id == 2 ?
                   Container(
                    width: MediaQuery.of(context).size.width-40,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.00)),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image:
                            NetworkImage("https://resources.pulse.icc-cricket.com/photo-resources/2019/07/07/bee07313-fb1f-4b29-b033-f761bb52d1d1/Shakib.jpg?width=845&height=476"),
                      ),
                    ),
                  ): SizedBox(height: 0,),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        child: Text(
                            _currentIndex == (widget.questions.length - 1)
                                ? "Submit"
                                : "Next"),
                        onPressed: _nextSubmit,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _nextSubmit() {
    if (_answerTextController.text == null) {
      _key.currentState.showSnackBar(SnackBar(
        content: Text("You must select an answer to continue."),
      ));
      return;
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => QuizFinishedPage(questions: widget.questions, answers: _answers)
      ));
    }
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
