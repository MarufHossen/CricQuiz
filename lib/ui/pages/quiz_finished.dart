import 'package:cricquiz/ui/pages/leaderboard.dart';
import 'package:cricquiz/ui/pages/quiz_page.dart';
import 'package:flutter/material.dart';

class QuizFinishedPage extends StatelessWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  QuizFinishedPage({Key key, @required this.questions, @required this.answers})
      : super(key: key);

  static const Color loginGradientStart = const Color(0xFF3498db);
  static const Color loginGradientEnd = const Color(0xFFf5f27cd);

  @override
  Widget build(BuildContext context) {
    int correct = 0;
    // this.answers.forEach((index,value){
    //   if(this.questions[index].correctAnswer == value)
    //     correct++;
    // });
    final TextStyle titleStyle = TextStyle(
        color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w500);
    final TextStyle trailingStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        elevation: 0,
        backgroundColor: Color(0xff27ae60),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
         
          Color(0xff27ae60),
           Colors.yellowAccent,
          // Theme.of(context).primaryColor,
          // Theme.of(context).accentColor
        ],stops: const [0.0, 1.0], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text("Total Questions", style: titleStyle),
                        trailing:
                            Text("${questions.length}", style: trailingStyle),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text("Score", style: titleStyle),
                        trailing: Text("${correct / questions.length * 100}%",
                            style: trailingStyle),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Correct Answers", style: titleStyle),
                  trailing: Text("$correct/${questions.length}",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Incorrect Answers", style: titleStyle),
                  trailing: Text(
                      "${questions.length - correct}/${questions.length}",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.orangeAccent,//Color(0xff27ae60),
                      child: Text("Goto Home", style: TextStyle(color: Colors.white),),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: RaisedButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.amber,
                      child: Text("Check Leaderboard", style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => LeaderBoard()));
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
